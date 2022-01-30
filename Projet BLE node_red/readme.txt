Création de l'image  : 
1-on commence par crée un répoertoire de travail
2-par la suite on clone le rep de buildroot
git clone https://github.com/buildroot/buildroot
3-installation des packets, dependencies:
sudo apt-get install libncurses5-dev bc
sudo apt-get install rsync
sudo apt-get install bc
4- on copie le fichier cloné dans un nouveau répertoire 
cd Development-tools/
cp -R buildroot/ rpi3_64_qemu
5-dans ce répertoire , on générer le mirolinuc pour rpi3, via le fichier de configuration
make raspberrypi3_64_defconfig
6-On personalise le microlinus par la commande
make menuconfig
un menu s'affiche et plusieus menus sont disponible; on modifie dans toolchain type on choisi external toolchain 
et on choisi Arm AArch64 , 
ensuite dans le filesystem images, on change la taille de l'image à 200M.
6-On exécute le build du microlinux avec la commande make.
une image est par la suite générée
lien de l'image: 
https://drive.google.com/file/d/1ReTd2GGE9gVKCl8BA6T4-rpB74-AU8rt/view?usp=sharing
7-Par la suite ,on teste le microlinux avec QEMU
on intalle tout d'abord qemu avel la commande: 
sudo apt-get install qemu-system-arm
dans le répertoire rpi3_64 , on crée le script shell suivant pour emuler la carte Rpi 3 qui contient l'image generé par buildroot : 
#!/bin/bash

qemu-system-aarch64 -M raspi3 -m 1024 \
                    -cpu cortex-a57 \
                    -kernel output/images/Image \
                    -dtb output/images/bcm2710-rpi-3-b.dtb \
                    -drive file=output/images/sdcard.img,format=raw \
                    -append "console=ttyAMA0 root=/dev/mmcblk0p2 rw panic=1 rootwait rootfstype \
                    -net nic -net user \
                    -nographic 

Creation d'une application BLE avec Node Red:

le fichier applicationBLE.json contient la partie bluetooth developpé avec Node Red.
J'ai eu un petit soucis au niveau de cette partie car mon smartphone se connecte a l'application BLE mais au niveau de NodeRed c'est toujours marqué disconnected .
 
 