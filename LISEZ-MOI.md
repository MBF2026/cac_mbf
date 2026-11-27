# Site du comité Commissaires aux comptes - MBF 2026 (TEAM REVELATION)

Ce dossier contient 4 fichiers : `index.html` (le site), `config.js` (vos réglages), `setup.sql` (la base de données) et ce guide.
Il vous faut un compte gratuit sur **Supabase** (la base de données qui garde avis, alertes et finances) et un hébergeur de pages web.
Les intitulés des menus Supabase peuvent varier légèrement, mais les étapes restent les mêmes.

## Étapes (environ 15 minutes, une seule fois)

1. **Créer le projet** : sur supabase.com, créez un compte puis un projet (« New project »). Notez le mot de passe de la base, même si vous n'en aurez pas besoin ici.
2. **Créer les tables** : ouvrez `setup.sql` (votre e-mail administrateur, duhamelzola08@gmail.com, y est déjà), copiez tout le script dans *SQL Editor*, puis cliquez sur *Run*.
3. **Autoriser les visiteurs sans compte** : dans *Authentication*, rubrique *Sign In / Providers*, activez **Allow anonymous sign-ins**.
4. **Créer votre compte administrateur** : dans *Authentication > Users*, cliquez sur *Add user*, saisissez exactement le même e-mail (duhamelzola08@gmail.com) et un mot de passe solide, et cochez la confirmation automatique de l'e-mail.
5. **Relier le site à la base** : dans *Project Settings > API* (ou *Data API*), copiez l'**URL du projet** et la clé publique **anon** (ou « publishable »). Collez-les dans `config.js`, à la place des textes VOTRE-...
6. **Mettre en ligne** : déposez les 4 fichiers à la racine de votre hébergeur. Exemples simples : Netlify Drop (glisser le dossier), GitHub Pages, Cloudflare Pages ou l'hébergement de votre domaine.
7. **Vous connecter en administrateur** : ouvrez `https://votre-site/#admin`, entrez e-mail et mot de passe. Le lien « Administration » n'apparaît ensuite que sur votre appareil connecté.

## À savoir

- **Administration réservée à vous** : la vraie protection est dans la base. Même quelqu'un qui bidouille la page ne peut rien écrire ni lire de confidentiel.
- **Lien public** : sans connexion des membres, toute personne qui a le lien peut lire le contenu public (missions, finances, événements, rapports). Ne diffusez le lien qu'à la promotion. Une connexion obligatoire des membres est possible comme amélioration.
- **Un avis par appareil** : chaque navigateur reçoit un identifiant technique. Quelqu'un qui efface les données de son navigateur pourrait noter une seconde fois.
- **Confidentialité, pas anonymat absolu** : votre nom n'est jamais affiché avec un avis ou une alerte, mais l'identifiant technique est enregistré.
- **Clé « anon »** : elle est faite pour être publique. Ne collez jamais la clé « service_role » dans `config.js`.
- **Sauvegarde** : Supabase propose un export de la base. Pensez à exporter les finances en fin de trimestre.
