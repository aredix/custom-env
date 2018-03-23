#!/bin/bash

echo "Script d'installation de mon environnement personnalisé"
sleep 1
echo "Ce script va installer X paquets par défaut listé ci dessous :"
echo "     - htop"
echo "     - nmap"
echo "     - ncat"
echo "     - nping"
echo ""

echo "L'installation va débuter dans 5 secondes"
sleep 1
echo "L'installation va débuter dans 4 secondes"
sleep 1
echo "L'installation va débuter dans 3 secondes"
sleep 1
echo "L'installation va débuter dans 2 secondes"
sleep 1
echo "L'installation va débuter dans 1 seconde"
sleep 1

echo "L'installation débute"
sleep 2

echo "création des différents répertoires racines"
mkdir .env
cd .env
mkdir tools
mkdir share
mkdir lib
mkdir includes
mkdir files
mkdir bin
mkdir backup
echo ""

clear
echo "Altération : bashrc"
sleep 1
if [ -f ~/.bashrc ]; then
	if [ -f ~/.env/backup/bashrc.lock ]; then
	echo "Il y a déjà un backup"
	else
	mv ~/.bashrc ~/.env/backup/bashrc.lock
	fi
fi
clear

echo "Téléchargement de deb2targz"
sleep 1 
wget https://raw.githubusercontent.com/aredix/ssh/master/deb2targz.sh
mv deb2targz.sh tools/
clear

echo "Téléchargement de deb2tarxz"
sleep 1 
wget https://raw.githubusercontent.com/aredix/ssh/master/deb2tarxz.sh
mv deb2tarxz.sh tools/
clear

echo "Téléchargement de Htop"
sleep 1
wget https://github.com/aredix/ssh/raw/master/htop.deb
mv htop.deb tools/
clear

echo "Téléchargement de nmap"
sleep 1
wget https://github.com/aredix/ssh/raw/master/nmap.deb
mv nmap.deb tools/
clear

echo "Téléchargement de tShark"
sleep 1
wget https://github.com/aredix/ssh/raw/master/tShark.deb
mv tShark.deb tools/
clear

echo "Téléchargement du nouveau bashrc"
sleep 1
wget https://raw.githubusercontent.com/aredix/ssh/master/bashrc
mv bashrc ./files/
clear

sleep 1

echo "création du lien symbolique pour le bashrc"

ln -s ~/.env/files/bashrc ~/.bashrc

sleep 1
echo "bashrc liée !"
sleep 1
clear

cd tools/
 	
chmod 777 ./*

echo "Installation de nmap, nping et ncat"
sleep 2 

~/.env/tools/deb2tarxz.sh ~/.env/tools/nmap.deb

clear

echo "Installation de htop"
sleep 2

~/.env/tools/deb2tarxz.sh ~/.env/tools/htop.deb

clear

echo "Installation de tShark"
sleep 2

~/.env/test/tools/deb2tarxz.sh ~/.env/tools/tShark.deb

clear


sleep 1
echo "Fin d'installation"
sleep 1
echo "Environnement prêt"
