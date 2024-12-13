const { App } = require('@slack/bolt');
const { WebClient } = require('@slack/web-api');
require("dotenv").config()
const CourseRepository = require('./CourseRepository');
const ProgressionRepository = require('./ProgressionRepository');
const UserRepository = require('./UserRepository');

const app = new App({
  token: process.env.SLACK_BOT_TOKEN,
  signingSecret: process.env.SLACK_SIGNING_SECRET
});
const client = new WebClient(process.env.SLACK_BOT_TOKEN);

function sleep() {
  const randomMs = Math.floor(Math.random() * (1000 - 500 + 1)) + 500;
  return new Promise(resolve => setTimeout(resolve, randomMs));
}

async function syncSlackUsers() {
  let allUsers = [];
  let cursor;

  do {
    const response = await client.users.list({
      limit: 200,
      cursor: cursor
    });

    if (response.ok) {
      allUsers = allUsers.concat(response.members);
      cursor = response.response_metadata && response.response_metadata.next_cursor;
    } else {
      throw new Error(`Erreur lors de la récupération des utilisateurs : ${response.error}`);
    }
  } while (cursor);

  const filteredUsers = allUsers
    .filter(u => !u.is_bot && !u.deleted)
    .map(u => ({
      slack_user_id: u.id,
      name: u.name
    }));

  await UserRepository.bulkInsertOrUpdateUsers(filteredUsers);
}

async function sendNextSteps(slackUserId) {
  const users = await UserRepository.getAllUsers();
  const user = users.find(u => u.slack_user_id === slackUserId);
  if (!user) {
    console.log(`Utilisateur ${slackUserId} non trouvé`);
    return;
  }

  let progression = await ProgressionRepository.getUserProgression(user.id);
  let courseId;
  let currentStep;
  
  if (!progression) {
    courseId = 1;
    currentStep = 0;
    await ProgressionRepository.upsertProgression(user.id, courseId, currentStep);
  } else {
    courseId = progression.course_id;
    currentStep = progression.current_step;
  }

  const course = await CourseRepository.getCourse(courseId);
  if (!course) {
    await client.chat.postMessage({
      channel: user.slack_user_id,
      text: "Ce cours n'existe plus."
    });
    return;
  }

  const steps = await CourseRepository.getCourseSteps(courseId);

  if (courseId > 1 && currentStep === 0) {
    await client.chat.postMessage({
      channel: user.slack_user_id,
      text: `Démarrons le cours : *${course.title}*`
    });
    await sleep();
  }

  for (let i = currentStep; i < steps.length; i++) {
    const step = steps[i];
    if (step.type === 'message') {
      await client.chat.postMessage({
        channel: user.slack_user_id,
        text: step.content
      });
    } else if (step.type === 'question') {
      let possibleAnswers = [];
      if (step.answers) {
        try {
          possibleAnswers = JSON.parse(step.answers);
        } catch (e) {
          console.error('Erreur de parsing JSON answers :', e);
          possibleAnswers = [];
        }
      }

      if (possibleAnswers.length === 0) {
        await client.chat.postMessage({
          channel: slackUserId,
          text: `Question: ${step.content}\n(Pas de réponses disponibles)`
        });
      } else {
        const blocks = [
          {
            "type": "section",
            "text": {
              "type": "mrkdwn",
              "text": `${step.content}`
            }
          },
          {
            "type": "actions",
            "elements": possibleAnswers.map(answer => ({
              "type": "button",
              "text": {
                "type": "plain_text",
                "text": answer
              },
              "action_id": `answer_${courseId}_${step.id}_${answer}`
            }))
          }
        ];

        await client.chat.postMessage({
          channel: slackUserId,
          blocks: blocks,
          text: step.content
        });

        await ProgressionRepository.upsertProgression(user.id, courseId, i);
        return;
      }
    }

    await ProgressionRepository.upsertProgression(user.id, courseId, i + 1);
    await sleep();
  }

  if (courseId > 1) {
    await client.chat.postMessage({
      channel: user.slack_user_id,
      text: `Le cours *${course.title}* est terminé !`
    });
  }

  await sleep();

  const nextCourse = await CourseRepository.getNextCourse(courseId);
  if (nextCourse) {
    const blocks = [
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": `On attaque le prochain cours : *${nextCourse.title}* ?`
        }
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Oui 👍"
            },
            "action_id": `next_${nextCourse.id}_1`
          },
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Non 👎"
            },
            "action_id": `next_${nextCourse.id}_0`
          }
        ]
      }
    ];

    await client.chat.postMessage({
      channel: user.slack_user_id,
      blocks: blocks,
      text: `On attaque le prochain cours : *${nextCourse.title}* ?`
    });
  }
}

app.action(/answer_\d+_\d+_.+/, async ({ body, ack, say }) => {
  await ack();

  const slackUserId = body.user.id;
  const action = body.actions[0];
  const actionValue = action.action_id;
  const [_, courseIdStr, stepIdStr, ...answerParts] = actionValue.split('_');
  const courseId = parseInt(courseIdStr, 10);
  const stepId = parseInt(stepIdStr, 10);
  const userAnswer = answerParts.join('_');

  const users = await UserRepository.getAllUsers();
  const user = users.find(u => u.slack_user_id === slackUserId);
  if (!user) return;

  const steps = await CourseRepository.getCourseSteps(courseId);
  const step = steps.find(s => s.id === stepId);
  if (!step) return;

  const correctAnswer = step.correct_answer || '';
  if (userAnswer.toLowerCase() === correctAnswer.toLowerCase()) {
    await say("Bonne réponse !");
  } else {
    await say(`Mauvaise réponse. La bonne réponse était : ${correctAnswer}`);
  }

  const progression = await ProgressionRepository.getUserProgression(user.id);
  await ProgressionRepository.upsertProgression(user.id, courseId, progression.current_step + 1);

  await sleep();
  await sendNextSteps(slackUserId);
});

app.action(/next_\d+_\d+/, async ({ body, ack, say }) => {
  await ack();

  const slackUserId = body.user.id;
  const action = body.actions[0];
  const actionValue = action.action_id;
  const [_, nextCourseIdStr, answerStr] = actionValue.split('_');
  const nextCourseId = parseInt(nextCourseIdStr, 10);
  const answer = parseInt(answerStr, 10);

  const users = await UserRepository.getAllUsers();
  const user = users.find(u => u.slack_user_id === slackUserId);
  if (!user) return;

  if(answer == 1) {
    await ProgressionRepository.upsertProgression(user.id, nextCourseId, 0);
    await sendNextSteps(slackUserId);
  } else {
    const blocks = [
      {
        "type": "section",
        "text": {
          "type": "mrkdwn",
          "text": "Ok quand tu seras pret clique juste ici"
        }
      },
      {
        "type": "actions",
        "elements": [
          {
            "type": "button",
            "text": {
              "type": "plain_text",
              "text": "Go 🚀"
            },
            "action_id": `next_${nextCourseId}_1`
          },
        ]
      }
    ];

    await client.chat.postMessage({
      channel: slackUserId,
      blocks: blocks,
      text: "Ok quand tu seras pret clique juste ici"
    });
  }
});

app.command('/marcel-sync', async ({ command, ack, say }) => {
  await ack();
  await syncSlackUsers();
  await say("Users synchronisés en base !");
});

app.command('/marcel-start', async ({ command, ack }) => {
  await ack();
  var users = await UserRepository.getAllUsers();
  users.forEach(async (user) => {
    await sendNextSteps(user.slack_user_id);
  })
});

app.message(async ({ message, say }) => {
  if (message.text === "quoi ?") {
    await say("feur");
    return;
  }
});

(async () => {
  const port = process.env.PORT || 3000;
  await app.start(port);
  console.log(`⚡️ L’application Slack est en cours d’exécution sur le port ${port}`);
})();
