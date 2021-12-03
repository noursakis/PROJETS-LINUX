#!/bin/sh
#Projet_Calculatrice(){ awk "BEGIN { print $* }"; }

echo "calculatrice"
echo "l'opération de soustraction se fait avec la commande SOUS"
echo "l'opération de division de fait avec la commande DIV"
echo "l'opération de Multiplication se fait avec la commande MUL"
echo "l'opération de sommation se fait avec la commande SOM"
echo "NB: faites attention de ne pas entrer un diviseur NULL"

while [ "$calculer" != "o" -o "$calculer" != "O" ]; do
	echo -n "entrer deux nombres"
	read A B
	echo "chosir le type d'opération mathématique valide : "
	read OP
	while [ "$OP" != "SOUS" -a "$OP" != "SOM" -a "$OP" != "MUL" -a "$OP" != "DIV" ]; do
		echo "Erreur ! veuillez saisir un opérateur valide !"
		read OP
	done
case "$OP" in
        SOUS ) echo "= $(($A-$B))";;
      	SOM ) echo "= $(($A+$B))";;
	MUL ) echo "= $(($A*$B))";;
	DIV ) while [ "$B" = "0" ]; do
 		echo "Veuillez entrer un diviseur non nul"
 		read B
        	done
 	        echo "scale=2; (($A/$B))" | bc -l;;
esac
        echo "Voulez vous continuer le calcul? O/N  "
        read  calculer
	if [ "$calculer" = "n" -o "$calculer" = "N" ]; then
		echo "Calcul terminé"
		break
	fi
done
