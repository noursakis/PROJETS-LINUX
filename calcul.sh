#!/bin/sh
#Projet_Calculatrice(){ awk "BEGIN { print $* }"; }

echo "calculatrice"
echo "l'opération de soustraction se fait avec la commande SOUS"
echo "l'opération de division de fait avec la commande DIV"
echo "l'opération de Multiplication se fait avec la commande MUL"
echo "l'opération de sommation se fait avec la commande SOM"
echo "NB: faites attention de ne pas entrer un diviseur NULL"
while [ "$calculer" != "o" -o "$calculer" != "O" ]
do

	echo -n "entrer deux nombres "
	read A B
	echo "choisir le type d'opération mathématique"
	read OP

case "$OP" in
      SOUS )

      echo echo "= $(($A-$B))";;

      SOM )

      echo "echo = $(($A+$B))";;

      MUL ) echo "= $(($A*$B))";;

      DIV ) while [ "$B" = "0" ]; do
 		echo "Veuillez entrer un diviseur non nul"
 		read B
		done
 	    echo "= $(($A/$B))";;
esac
        echo "Voulez vous continuer le calcul? O/N  "
        read  calculer
	if [ "$calculer" = "n" -o "$calculer" = "N" ]; then
		echo "Calcul terminé"
		break
	fi
done
