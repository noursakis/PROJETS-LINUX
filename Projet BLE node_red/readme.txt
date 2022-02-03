# Projet 5: Buildroot 
On commence par installer une image Ubuntu sur VirtualBox , le configurer pour avoir internet.
## Partie1: Test et compilation d’un OS linux avec buildroot

On commence par créer un répertoire de travail qu'on appelle Development-tools/ :
```bash
mkdir Development-tools/
```
Installation des lib ainsi que les dépendances nécessaires :
```bash
sudo apt-get install libncurses5-dev bc​
sudo apt install build-essential​
sudo apt-get install manpages-dev unzip
```
Dans le répertoire development-tools on clone git de Buildroot :
```bash
git clone https://github.com/buildroot/buildroot
sudo apt-get upgrade 
sudo apt-get update
```
On vérifie que la rpi3 est bien présente dans les fichiers de préconfiguration de buildroot
```bash
ls configs/raspberrypi*
```
On crée un dossier afin de générer une image  qu'on testera avec Qemu, en dupliquant le dossier buildroot en pi3-qemu-aarch64 

```bash
cp -R buildroot/ pi3-qemu-aarch64
```
On se place dans le repertoire pi3-qemu-aarch64,et on lance l'interface de configuration de buildroot:
```bash
cd pi3-qemu-aarch64
make raspberrypi3_64_defconfig
```
On obtient une interface graphique qui nous permettra de configurer l'image:
Dans Toolchain Type, choisir External Toolchain 
Dans Toolchain, choisir Arm AArch64 2021.07
Dans le menu Filesystem images on change la valeur de exact size à 200M.


ensuite on génére l'image avec la commande : 

```bash
Make
```
Finalement, aprés compilation on obtient une image sdcard.img : 
https://drive.google.com/file/d/1ReTd2GGE9gVKCl8BA6T4-rpB74-AU8rt/view?usp=sharing


## Partie2: Test de l'image avec Qemu:
Installation de Qemu:
```bash
sudo apt-get install qemu-system-arm
```
Dans le répertoire rpi3_64_qemu, on crée un script shell contenant la commande suivante :
```python
#!/bin/bash

qemu-system-aarch64 -M raspi3 -m 1024 \
                    -cpu cortex-a57 \
                    -kernel output/images/Image \
                    -dtb output/images/bcm2710-rpi-3-b.dtb \
                    -drive file=output/images/sdcard.img,format=raw \
                    -append "console=ttyAMA0 root=/dev/mmcblk0p2 rw panic=1 rootwait rootfstype \
                    -net nic -net user \
                    -nographic
```
Une fois le script exécuté ,on rentre bien dans l'invite de commande de la Raspberry.
## Partie3: création d'une application BLE avec Node Red
On commence par installer la lib node-red-contrib-generic-ble pour obtenir les nodes nécessaires.
malheureusement j'ai eu un petit soucis au niveau de cette partie car mon smartphone se connecte a l'application BLE mais au niveau de Node RED c'est toujours marqué disconnected.
Le problème réside dans la communication entre le téléphone (iPhone)et la carte, en changeant vers un autre téléphone Android une fois appairés via Bluetooth, BLE in reconnait l'appareil , affiche son nom , son adresse Mac ainsi que son UUID (Universally unique identifier)
Par contre l'acquisition de l'information n'a pas eu lieu avec l'erreur : NOTHING TO READ
![](cap18_BLE.PNG)








## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
