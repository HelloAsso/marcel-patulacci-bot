INSERT INTO `courses` (`title`,)
VALUES
('Introduction');

INSERT INTO `course_steps` (`course_id`, `step_order`, `type`, `content`, `correct_answer`)
VALUES
(1, 1, 'message', 'Bonjour, je m''appelle Marcel Patulacci, brigadier chef... et agent de la paix avant tout.', NULL),
(1, 2, 'message', 'J’ai traversé des serveurs, neutralisé des pirates 🏴‍☠️.', NULL),
(1, 3, 'message', 'Mon flair pour la cybersécurité ferait pâlir un hacker.', NULL),
(1, 4, 'message', 'J’ai aidé Interpol à coincer un gang de ransomwares.', NULL),
(1, 5, 'message', 'Aujourd’hui, je suis là pour vous guider, vous protéger.', NULL),
(1, 6, 'message', 'Mon secret: une bonne dose de café et du code chiffré.', NULL),
(1, 7, 'message', 'Ensemble, nous ferons échouer les attaques futures.', NULL),
(1, 8, 'message', 'Restez zen, je suis votre bouclier numérique ⚔️.', NULL),
(1, 9, 'message', 'Mes informateurs? Des IA et quelques vieux robots rouillés.', NULL),
(1, 10, 'message', 'Mon credo: "Mieux vaut prévenir que pirater."', NULL);

INSERT INTO `courses` (`title`, `description`)
VALUES
('Sensibilisation au phishing', 'Apprenez à reconnaître et éviter le phishing en ligne.');

INSERT INTO `course_steps` (`course_id`, `step_order`, `type`, `content`, `answers`, `correct_answer`)
VALUES
(2, 1, 'message', 'Le phishing, c’est quand un fraudeur imite un site ou un email.', NULL, NULL),
(2, 2, 'message', 'Son but: vous faire cliquer sur un lien et voler vos données.', NULL, NULL),
(2, 3, 'message', 'Plus de 90% des cyberattaques commencent par un email de phishing.', NULL, NULL),
(2, 4, 'message', 'Un email suspect demande souvent des infos perso, méfiez-vous.', NULL, NULL),
(2, 5, 'message', 'Les fautes d’orthographe ou l’URL bizarre sont des indices.', NULL, NULL),
(2, 6, 'message', 'Vérifiez toujours l’expéditeur avant d’ouvrir un lien.', NULL, NULL),
(2, 7, 'message', 'Ne donnez jamais votre mot de passe via un lien reçu par mail.', NULL, NULL),
(2, 8, 'message', 'Les pièces jointes inconnues peuvent contenir des malwares.', NULL, NULL),
(2, 9, 'message', 'En 2023, le phishing a coûté des millions aux entreprises 💸.', NULL, NULL),
(2, 10, 'message', 'La vigilance est votre meilleure défense contre le phishing.', NULL, NULL),
(2, 11, 'message', 'Un email trop urgent ou trop beau pour être vrai est suspect.', NULL, NULL),
(2, 12, 'message', 'Évitez de cliquer sur les liens dans les mails non attendus.', NULL, NULL),
(2, 13, 'message', 'Pensez à vérifier le domaine du site avant de saisir un mot de passe.', NULL, NULL),
(2, 14, 'message', '60% des victimes de phishing ne savaient pas reconnaître un faux mail.', NULL, NULL),
(2, 15, 'message', 'Ne répondez jamais à une demande d’info sensible sans vérifier.', NULL, NULL),
(2, 16, 'message', 'Si un mail vous surprend, demandez confirmation à l’expéditeur officiel.', NULL, NULL),
(2, 17, 'message', 'La barre d’adresse du navigateur est votre alliée, contrôlez-la.', NULL, NULL),
(2, 18, 'message', 'Le phishing cible souvent vos données bancaires ou d’accès.', NULL, NULL),
(2, 19, 'message', 'Les cybercriminels utilisent la pression et la peur 😰.', NULL, NULL),
(2, 20, 'question', 'Que faire si un lien semble suspect ?', '["Cliquer","Supprimer","Vérifier d’abord"]', 'Vérifier d’abord'),
(2, 21, 'message', 'Utilisez un antivirus et un antispam à jour.', NULL, NULL),
(2, 22, 'message', 'La formation régulière réduit le risque de tomber dans le piège.', NULL, NULL),
(2, 23, 'message', 'Attention aux emails imitant votre banque ou fournisseur Internet.', NULL, NULL),
(2, 24, 'message', 'Ne partagez pas vos infos persos sur des sites non sécurisés.', NULL, NULL),
(2, 25, 'message', 'Le cadenas dans la barre URL est bon signe, mais restez prudent.', NULL, NULL),
(2, 26, 'question', 'Que vérifiez-vous avant d’ouvrir une PJ ?', '["L’expéditeur","Rien","L’heure"]', 'L’expéditeur'),
(2, 27, 'message', 'Demandez à un collègue s’il a reçu le même mail suspect.', NULL, NULL),
(2, 28, 'message', 'Ignorez les emails promettant un gain rapide.', NULL, NULL),
(2, 29, 'message', 'Les attaques sont parfois très convaincantes, restez alerte.', NULL, NULL),
(2, 30, 'message', 'Le phishing touche tous les secteurs, personne n’est épargné.', NULL, NULL),
(2, 31, 'message', 'Les liens raccourcis peuvent cacher une adresse frauduleuse.', NULL, NULL),
(2, 32, 'message', '70% des entreprises ont été ciblées par une campagne de phishing.', NULL, NULL),
(2, 33, 'message', 'Signalez tout email suspect à votre service informatique.', NULL, NULL),
(2, 34, 'message', 'Ne transférez pas un email douteux sans avertir le destinataire.', NULL, NULL),
(2, 35, 'message', 'Un mot de passe compromis ouvre la porte à d’autres attaques.', NULL, NULL),
(2, 36, 'question', 'Si un email demande vos identifiants ?', '["Répondre","Vérifier","Ignorer"]', 'Vérifier'),
(2, 37, 'message', 'Les escrocs profitent de votre confiance, ne tombez pas dedans.', NULL, NULL),
(2, 38, 'message', 'Les liens malveillants redirigent vers des pages clones.', NULL, NULL),
(2, 39, 'message', 'Suivez les directives de l’entreprise pour signaler un phishing.', NULL, NULL),
(2, 40, 'message', 'Un doute ? Consultez votre référent sécurité.', NULL, NULL),
(2, 41, 'message', 'Le phishing évolue, restez formé aux nouvelles menaces.', NULL, NULL),
(2, 42, 'message', 'La double authentification réduit les risques.', NULL, NULL),
(2, 43, 'question', 'Que faire si vous avez cliqué par erreur ?', '["Rien","Changer mdp","Ignorer"]', 'Changer mdp'),
(2, 44, 'message', 'Ne paniquez pas, signalez toute suspicion rapidement.', NULL, NULL),
(2, 45, 'message', 'Évitez les réponses hâtives. Réfléchissez avant d’agir.', NULL, NULL),
(2, 46, 'message', 'Les cybercriminels comptent sur votre inattention.', NULL, NULL),
(2, 47, 'message', 'Chaque employé est une cible potentielle, restez vigilant.', NULL, NULL),
(2, 48, 'message', 'La sensibilisation réduit de 50% le risque d’attaque réussie.', NULL, NULL),
(2, 49, 'message', 'Mieux vaut prévenir que réparer les dégâts.', NULL, NULL),
(2, 50, 'message', 'La sécurité, c’est l’affaire de tous, protégez vos données 🙌.', NULL, NULL);

INSERT INTO `courses` (`title`, `description`)
VALUES
('Sensibilisation à la fraude au PDG', 'Apprenez à détecter les tentatives de fraude au PDG.');

INSERT INTO `course_steps` (`course_id`, `step_order`, `type`, `content`, `answers`, `correct_answer`)
VALUES
(3, 1, 'message', 'La fraude au PDG vise à imiter un dirigeant pour soutirer des fonds.', NULL, NULL),
(3, 2, 'message', 'Des emails urgents, signés "Directeur", vous demandent un virement.', NULL, NULL),
(3, 3, 'message', 'C’est une technique redoutable: 3 milliards $ volés en 3 ans.', NULL, NULL),
(3, 4, 'message', 'En 2019, une filiale d’Airbus a perdu 50 millions € sur un faux ordre.', NULL, NULL),
(3, 5, 'message', 'Le criminel mise sur la peur ou la pression: "Faites vite!"', NULL, NULL),
(3, 6, 'message', 'Les victimes hésitent, pensent "C’est le boss! Je dois obéir."', NULL, NULL),
(3, 7, 'message', 'Un mail du patron en voyage qui demande un transfert ? Méfiance.', NULL, NULL),
(3, 8, 'message', '90% des fraudes au PDG passent par l’ingénierie sociale.', NULL, NULL),
(3, 9, 'message', 'La société FACC (Autriche) a perdu 50 M€ en obéissant à un faux mail PDG.', NULL, NULL),
(3, 10, 'question', 'Que faire si un dirigeant demande un virement inattendu ?', '["Exécuter","Vérifier","Ignorer"]', 'Vérifier'),
(3, 11, 'message', 'Les fraudeurs imitent le style d’écriture et la signature du patron.', NULL, NULL),
(3, 12, 'message', 'Un simple appel au vrai dirigeant peut éviter la catastrophe.', NULL, NULL),
(3, 13, 'message', 'Le silence est le complice des escrocs, parlez, vérifiez.', NULL, NULL),
(3, 14, 'message', 'Derrière un email, il y a parfois une mafia numérique 😈.', NULL, NULL),
(3, 15, 'message', 'Utiliser la double validation: email + appel téléphonique.', NULL, NULL),
(3, 16, 'message', 'En 2021, une PME française a versé 200k€ à un faux PDG.', NULL, NULL),
(3, 17, 'message', 'La fraude au PDG exploite la hiérarchie et la confiance interne.', NULL, NULL),
(3, 18, 'message', 'Faites attention aux voyages annoncés: "Je suis à Hong Kong, urgent!"', NULL, NULL),
(3, 19, 'question', 'Si le mail prétend être "top secret", réagissez comment ?', '["Obéir","Consulter un collègue","Effacer"]', 'Consulter un collègue'),
(3, 20, 'message', 'Les chaines hiérarchiques sont brisées par le stress imposé.', NULL, NULL),
(3, 21, 'message', 'Pour contrer, ayez des procédures de validation solides.', NULL, NULL),
(3, 22, 'message', 'Crelan Bank (Belgique) a perdu 70 M€ via un faux email PDG.', NULL, NULL),
(3, 23, 'message', 'N’envoyez jamais d’argent sur un compte inconnu sans confirmation.', NULL, NULL),
(3, 24, 'message', 'Un indice: l’email ne correspond pas au domaine officiel.', NULL, NULL),
(3, 25, 'message', 'Les escrocs vous imposent une pression temporelle.', NULL, NULL),
(3, 26, 'message', 'Demandez une confirmation par un autre canal (tel, Teams).', NULL, NULL),
(3, 27, 'message', 'Le risque ne touche pas que les grandes entreprises.', NULL, NULL),
(3, 28, 'message', 'Une PME peut perdre ses économies en une opération frauduleuse.', NULL, NULL),
(3, 29, 'message', 'L’arnaque profite du respect de l’autorité.', NULL, NULL),
(3, 30, 'message', 'Même une petite hésitation peut sauver des milliers d’€. 😅', NULL, NULL),
(3, 31, 'question', 'Si un mail urgent demande un IBAN inconnu ?', '["Vérifier","Obéir","Répondre"]', '["Vérifier","Obéir","Répondre"]'),
(3, 32, 'message', 'Renseignez-vous sur les modes opératoires connus.', NULL, NULL),
(3, 33, 'message', 'Si vous doutez, prévenez le service financier.', NULL, NULL),
(3, 34, 'message', 'L’éducation interne diminue le risque de 50%.', NULL, NULL),
(3, 35, 'message', 'Un cas connu: Le "Fake President Fraud" en série dans la presse.', NULL, NULL),
(3, 36, 'message', 'Votre vigilance est le pare-feu le plus efficace.', NULL, NULL),
(3, 37, 'message', 'La fraude au PDG est un phishing ultra ciblé.', NULL, NULL),
(3, 38, 'message', 'L’accès aux infos du boss sur LinkedIn aide les fraudeurs.', NULL, NULL),
(3, 39, 'message', 'Plus la hiérarchie est complexe, plus la fraude est facile.', NULL, NULL),
(3, 40, 'message', 'Un simple doute vaut mieux qu’une perte massive.', NULL, NULL),
(3, 41, 'message', 'L’escroc veut créer une urgence factice.', NULL, NULL),
(3, 42, 'question', 'Que faire si vous venez de transférer de l’argent par erreur ?', '["Prévenir la banque","Rien","Supprimer l’email"]', 'Prévenir la banque'),
(3, 43, 'message', 'En parler à un collègue peut stopper le transfert à temps.', NULL, NULL),
(3, 44, 'message', 'Gardez la tête froide, même face à un "ordre du boss".', NULL, NULL),
(3, 45, 'message', 'La sécurité interne, c’est tout le monde qui y participe.', NULL, NULL),
(3, 46, 'message', 'Les fraudeurs se font passer pour des VIP de l’entreprise.', NULL, NULL),
(3, 47, 'message', 'Un appel rapide au PDG vrai donne la vérité.', NULL, NULL),
(3, 48, 'message', 'Une seule erreur et c’est des milliers d’€ volés.', NULL, NULL),
(3, 49, 'message', 'Rappeler les procédures internes, c’est vital.', NULL, NULL),
(3, 50, 'message', 'La fraude au PDG est une menace: soyons prêts 🤝.', NULL, NULL);