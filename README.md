# Terraform-mini-projet
Déployer une VM avec le service EC2 d'AWS

◦ Ecrire un module pour créer une instance ec2 utilisant la dernière version de ubuntu bionic (qui 
s’attachera l’ebs et l’ip publique) dont la taille et le tag seront variabilisés

◦ Ecrire un module pour créer un volume ebs dont la taille sera variabilisée

◦ Ecrire un module pour une ip publique (qui s’attachera la security group)

◦ Ecrire un module pour créer une security qui ouvrira le 80 et 443

◦ Créer un dossier app qui va utiliser les 4 modules pour déployer une ec2, bien-sûr vous allez surcharger 
les variables afin de rendre votre application plus dynamique

◦ A la fin du déploiement, installation d'nginx et enregistrement de l’ip publique dans un fichier nommé ip_ec2.txt
