# marcel-patulacci-bot

## Description
Ce projet est une bot Slack permettant de diffuser des cours interactifs aux utilisateurs de différents workspaces Slack. L’application :

- Gère plusieurs cours, composés d’étapes (messages, questions).
  - Exemple de cours dans le fichier `sql/data.sql` 
- Propose des questions avec des boutons interactifs.
- Suit la progression de chaque utilisateur en base de données.
- Gère un rythme d’envoi des messages avec un délai aléatoire pour un rendu plus humain.

## Fonctionnalités
- **Diffusion de cours** : Envoie automatiquement l’ensemble des étapes d’un cours.
- **Questions interactives** : Les étapes de type "question" utilisent des boutons Slack (Block Kit) pour permettre à l’utilisateur de répondre par simple clic.
- **Progression utilisateur** : La progression (cours, étape actuelle) est stockée en base et mise à jour à chaque étape.
Proposition du cours suivant : À la fin d’un cours, l’application propose d’enchaîner sur le prochain. L’utilisateur répond "oui" ou "non".

## Pré-requis
- Un compte Slack et un workspace dans lequel vous avez les droits nécessaires pour ajouter des applications.
- Node.js et npm installés localement.
- Une base de données MySQL accessible.
- Un outil comme ngrok si vous développez localement, afin d’exposer votre application sur une URL publique HTTPS (nécessaire pour les événements Slack).

## Installation
1. Cloner le projet

```bash
git clone git@github.com:HelloAsso/marcel-patulacci-bot.git
cd marcel-patulacci-bot
```

2. Installer les dépendances

```bash
npm install
````

3. Configuration de la base de données

Créez les tables et colonnes telles que décrites dans le code SQL fourni (tables workspaces, users, courses, course_steps, progression).

4. Variables d’environnement

Créez un fichier .env à la racine du projet avec les variables suivantes :
```env
SLACK_BOT_TOKEN=xoxb-...
SLACK_SIGNING_SECRET=...
DB_HOST=localhost
DB_USER=root
DB_PASS=mypassword
DB_NAME=mydb
PORT=3000
```

- `SLACK_BOT_TOKEN` et `SLACK_SIGNING_SECRET` proviennent de la configuration de l’application Slack (voir ci-dessous).
- `DB_*` sont les infos de connexion à la base MySQL.
- `PORT` est le port sur lequel votre application écoute.


## Configuration de l’application Slack
1. Création de l’application Slack

- Rendez-vous sur https://api.slack.com/apps.
- Cliquez sur **"Create New App"**.
- Donnez un nom à votre application et choisissez le workspace dans lequel vous la créez.

2. OAuth & Permissions

- Dans la section **"OAuth & Permissions"**, ajoutez les scopes nécessaires :
  - Bot Token Scopes : `chat:write`, `commands`, `im:history`, `users:read`
- Cliquez sur "Install to Workspace" puis "Allow".
- Copiez le **Bot User OAuth Token** (format `xoxb-...`) et placez-le dans votre `.env` sous `SLACK_BOT_TOKEN`.

3. Signing Secret

- Dans la section "Basic Information", copiez la valeur du Signing Secret et placez-la dans le `.env` sous `SLACK_SIGNING_SECRET`.

4. Event Subscriptions

- Activez "Event Subscriptions" dans la section correspondante.
- Renseignez une URL publique (par exemple obtenue via `ngrok http 3000)`.
- Slack enverra un challenge, votre app (Bolt) le gère automatiquement.
- Dans "Subscribe to bot events", ajoutez :
  - `message.im`
- Cliquez sur "Save Changes".

5. Slash Commands

Créez deux slash commands (exemples) dans la section "Slash Commands" :

- `/marcel-sync` : pour synchroniser les utilisateurs du workspace et les enregistrer en base.
- `/marcel-start` : pour initier l’envoi du premier cours à tous les utilisateurs.
Dans l’URL, mettez l’URL publique (ex: `https://<votre-domaine-ngrok>/slack/events`).

Après création, Slack vous donnera un `Request URL` qui doit pointer vers l’URL de votre application (`https://<votre-domaine>/slack/events`).

N’oubliez pas de sauvegarder.

## Lancement de l’application

```bash
node app.js
```

Assurez-vous que votre application est accessible depuis l’URL publique configurée dans Slack (par exemple via `ngrok`).

## Utilisation

- /marcel-sync : Met à jour la liste des utilisateurs en base.
- /marcel-start : Lance le cours initial (ex: course_id=1) pour tous les utilisateurs du workspace actuel.
- Le bot envoie ensuite les étapes du cours, question après question, message après message, gère la progression, et propose le cours suivant une fois le cours actuel terminé.

## Personnalisation

- Ajoutez vos cours et steps dans la base `courses` et `course_steps`.
- Les réponses aux questions sont stockées au format JSON dans `course_steps.answers`.

## Support / Contributions

Pour toutes questions, ouvrez une issue sur le dépôt GitHub du projet. Les contributions sont les bienvenues !
