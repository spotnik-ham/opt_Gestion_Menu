#!/bin/sh
#
#===================================
# Creation le 14/04/2020
# Par F1PTL Bruno
# Version 3.18
# Modifier le 23/04/2020
# Par F5NLG JEAN-Philippe
#===================================
#####################################
# Variables #
#############
REP_COURANT=`pwd`
FIC_REF="Fichiers_Ini_Ref"
FIC_REF_TAR="Fichiers_Ini_Ref.tar"
SER_OUTIL="Services_Outils"
SER_OUTIL_TAR="Services_Outils.tar"
export LANGUAGE=en_US.UTF-8
#####################################
if [ $(id -u) -ne 0 ]
        then
        echo ""
        echo "==> Lancement avec les droits root"
        exit 1
fi

if (whiptail --title "F1PTL-F5NLG MENU Version 3.18" --yesno "Renseigner les informations demandees afin de mettre a jour tous les fichers d initialisations. Indicatif, ID-DMR, ID-NXDN, Departement..." 8 78); then
    	echo "==> vous avez valider votre choix"
	else
    	echo "==> vous avez annule"; exit 1
fi


INDICATIF=$(whiptail --title "Input" --inputbox "Quel est ton indicatif ?" 10 60 FXXXX 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
IDDMR7=$(whiptail --title "Input" --inputbox "Quel est ton ID-DMR 7 digits ?" 10 60 208XXXX 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
IDDMR9=$(whiptail --title "Input" --inputbox "Quel est ton ID-DMR 9 digits ? \n (Modifier les 2 derniers digits)" 10 60 ${IDDMR7}01 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
IDNXDN=$(whiptail --title "Input" --inputbox "Quel est ton ID-NXDN ? \n (Pas d ID-NXDN prendre 9999)" 10 60 9999 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi
#
dept=$(whiptail --title "Input" --inputbox "Quel est le Numero de Departement ?   \n (Numero de departement ou code pays)  " 10 60 99 3>&1 1>&2 2>&3)
exitstatus=$?
if [ $exitstatus != 0 ]; then
echo "==> vous avez annule"; exit 1
fi

MASTER_IP_BM=$(whiptail --title "Choix du Master DMR" --radiolist \
"Cocher la case qui correspond a votre choix" 16 60 8 \
"127.0.0.1" "No DMR Master" ON \
"164.132.195.103" "IPCS2_FR" OFF \
"213.222.29.197" "BM_Netherlands_2042" OFF \
"217.182.129.131" "BM_France_2082" OFF \
"158.69.203.89" "BM_Canada_3021" OFF \
"213.32.19.95" "HBlink_Nord" OFF \
"saint-appo.fr" "HBlink_Loire" OFF \
"151.80.37.99" "HBlink_Pyr.O" OFF \
"51.178.51.244" "HBlink_Limouzi" OFF \
"51.178.86.131" "HBlink_Yvelines" OFF 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi

if [ ${MASTER_IP_BM} = "109.15.57.11" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi

if [ ${MASTER_IP_BM} = "51.178.51.244" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi

if [ ${MASTER_IP_BM} = "151.80.37.99" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi

if [ ${MASTER_IP_BM} = "saint-appo.fr" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi

if [ ${MASTER_IP_BM} = "213.32.19.95" ]; then
	PORT_HB=$(whiptail --title "Choix du Serveur HBlink" --radiolist \
	"Choisir en fonction du port disponible sur le serveur HBlink" 15 60 10 \
	"55570" "DMO70" ON \
	"55571" "DMO71" OFF \
	"55572" "DMO72" OFF \
	"55573" "DMO73" OFF \
	"55574" "DMO74" OFF \
	"55575" "DMO75" OFF \
	"55576" "DMO76" OFF \
	"55577" "DMO77" OFF \
	"55578" "DMO78" OFF \
	"55579" "DMO79" OFF 3>&1 1>&2 2>&3)
fi
exitstatus=$?
if [ $exitstatus != 0 ]; then
	echo "==> vous avez annule"; exit 1
fi

for file in ${REP_COURANT}/${FIC_REF}/*
do
  sed -i -e "s/indicatif/${INDICATIF}/g" "$file"
  sed -i -e "s/iddmr7/${IDDMR7}/g" "$file"
  sed -i -e "s/iddmr9/${IDDMR9}/g" "$file"
  sed -i -e "s/idnxdn/${IDNXDN}/g" "$file"
  sed -i -e "s/dept/${dept}/g" "$file"
  sed -i -e "s/master_ip_bm/${MASTER_IP_BM}/g" "$file"

  if [ ${MASTER_IP_BM} = "164.132.195.103" ]; then
        sed -i -e "s/Port=62031/Port=55555/g" "$file"
  fi
done

mv ${REP_COURANT}/${FIC_REF} ${REP_COURANT}/${FIC_REF}_${INDICATIF}
tar xf ${REP_COURANT}/${FIC_REF_TAR}


echo ""
echo "###########################################"
echo "==> Copie des fichiers .ini de ${INDICATIF}"
echo "###########################################"
cd $REP_COURANT
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/Analog_Bridge.ini /opt/Analog_Bridge
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/Analog_Bridge.ini /opt/Analog_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/dvsm.macro /opt/Analog_Bridge
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/dvsm.macro /opt/Analog_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/DVSwitch.ini /opt/MMDVM_Bridge
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/DVSwitch.ini /opt/MMDVM_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/MMDVM_Bridge.ini /opt/MMDVM_Bridge
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/MMDVM_Bridge.ini /opt/MMDVM_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/NXDNGateway.ini /opt
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/NXDNGateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/P25Gateway.ini /opt
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/P25Gateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/YSFGateway.ini /opt
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/YSFGateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/ircddbgateway /etc
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/ircddbgateway /etc"
# 
# MODIF pour le spotnik 4.0
#
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/svxlink.num /etc/spotnik
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/svxlink.num /etc/spotnik"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/svxlink.cfg /etc/spotnik
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/svxlink.cfg /etc/spotnik"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/svxlink.el /etc/spotnik
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/svxlink.el /etc/spotnik"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/svxlink.fdv /etc/spotnik
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/svxlink.fdv /etc/spotnik"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/config.json /etc/spotnik
echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/config.json /etc/spotnik"



echo ""
echo "########################################"
echo "==>    Fin de la Config initial      <=="
echo "==>                                  <=="
echo "==> Appuyer sur Enter pour continuer <=="
echo "==>  Le Spotnik rebootera dans 10s   <=="
echo "########################################"

sleep 4
/etc/spotnik/num.sh

read x
