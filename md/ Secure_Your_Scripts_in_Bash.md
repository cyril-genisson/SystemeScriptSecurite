<div style="display: flex; align-items: center; justify-content: center;">
  <img src="./images/logo-bash.png" alt="logo">
  <h1 style="padding-left: 20px">Sécuriser ses Scripts Bash !</h1>
</div>

<br>
<br>

En suivant ces bonnes pratiques, vous pouvez réduire les risques de sécurité associés à vos scripts Bash. Gardez à l'esprit que la sécurité est un processus continu, et il est important de rester vigilant et de surveiller activement les nouvelles menaces et les meilleures pratiques de sécurité.

<br>

---

<br>

## 1. Validation des entrées utilisateur : 
Toujours valider les entrées utilisateur pour éviter les injections de code ou les erreurs potentielles. Utilisez des fonctions comme read pour récupérer les entrées utilisateur et effectuez une validation pour vous assurer qu'elles sont conformes à ce que vous attendez.

<br>

## 2. Utilisation de variables : 
Utilisez des variables pour stocker des données sensibles et assurez-vous qu'elles sont correctement protégées. Évitez d'utiliser des noms de variables prévisibles ou susceptibles d'être remplacés accidentellement par des commandes.

<br>

## 3. Limitation des privilèges : 
Évitez d'exécuter des scripts en tant qu'utilisateur root sauf si c'est absolument nécessaire. Si possible, définissez des permissions strictes pour les fichiers et répertoires utilisés par les scripts.

<br>

## 4. Échappement des caractères spéciaux :
Échappez les caractères spéciaux dans les données fournies par l'utilisateur pour éviter les attaques par injection de code. Vous pouvez utiliser des outils comme sed, awk ou grep pour nettoyer les entrées.

<br>

## 5. Mises à jour régulières :
Assurez-vous que vos scripts sont à jour et incluez des mécanismes de mise à jour automatique si nécessaire pour corriger les éventuelles vulnérabilités découvertes.

<br>

## 6. Sécurisation des fichiers de script :
Limitez l'accès aux fichiers de script en définissant des permissions appropriées. Assurez-vous que seuls les utilisateurs autorisés peuvent les modifier ou les exécuter.

<br>

## 7. Journalisation des activités :
Implémentez une journalisation pour enregistrer les activités des scripts. Cela peut vous 
aider à identifier les comportements suspects ou les problèmes de sécurité potentiels.

<br>

## 8. Révision du code :
Faites réviser votre code par des pairs pour repérer les éventuelles vulnérabilités ou erreurs de logique. Une autre paire d'yeux peut souvent repérer des problèmes que vous auriez pu manquer.

<br>

## 9. Utilisation de fonctions sécurisées :
Utilisez des fonctions de sécurité intégrées lorsque cela est possible, par exemple, utilisez des fonctions de hachage intégrées pour le traitement des mots de passe au lieu de les stocker en texte brut.

<br>

## 10. Évitez l'évaluation de commandes dynamiques :
Évitez d'utiliser des évaluations de commandes dynamiques comme eval, car elles peuvent introduire des vulnérabilités si elles ne sont pas correctement contrôlées.