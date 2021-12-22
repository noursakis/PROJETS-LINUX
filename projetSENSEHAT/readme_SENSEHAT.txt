Projet 4 : Node red et senseHAT
Le but de se projet c'est la récupération et l'envoi de donnés récupérés à
à partir du SenseHAT d'une RP 1 à une RP2 via le protocole MQTT .
1-Pour L'envoi : 
On a résalié un script python pour chaque donnés à envoyer : Température,
Humidité , l'accélération dur les 3 axes  , Pression que j'ai par la suite appelé 
par un Bloc Execute (EXEC) sur node-red : dans le bloc execute on met la meme(on aurai 
pu le faire directement avec le node senseHAT mais il ya eu un probléme de version de 
python)
chaque bloc EXEC est précédé par un node MQTT à destination du BROKER qui 
est cette fois ci l'autre RP (destinataire) ainsi qu'un TOPIC pour chaque 
valeur à envoyer (exple tpt pour température)
2-Pour la réception: 
On commence par un node MQTT recive , qui contient LOCALHOST comme serveur
et le meme topic indiqué par la RP1 ou récupérer une certaine sortie du SenseHAT.
la sortie du node MQTT est injectée dans une entrée de node Graphique (gauge ou chart..)
Pour l'envoie du texte une  sortie supplémentaire pour l'affichage sur la matrice de 
la RP1 qui est un node SenseHAT OUT.
RQUE:IL FAUT AJOUTER LA PARTIE DE TRONCAGE DU MESSAGE ENVOYE PAR LE CAPTEUR D'ACCELERATION (node function)
PARTIE FACULTATIVE : ENVOIE DE L'image. 
1/Pour l'envoi :
on a commencé par enregistrer une image pixélisée avec l'extension.png de taille8*8 
sous /home/pi , MQTT ne permet pas d'envoyer une image directement , on a donc pensé à 
la coder puis l'envoyer .
On a  crée un fichier avec le node"CREATE FILE" qu'on a codé par la suite avec le bloc
"BIT26" . cette image codé sera envoyé par MQTT.
2/Pour la réception de l'imae dans la RP2: 
En récupérant la partie codée de l'image on a réussi à crée un file dans la RP2 qui contient
l'image codée(en changeant le nom du fichier initial de imagerp.png à noursakis.png).
il ne reste que de crée un simple scrpit python qui permet d'afficher l'image sur le 
senseHAT , le mettre dans un bloc EXEC suivi d'un node SenseHAT OUT et l'image s'affiche sur 
sur la martrice de la RP2

