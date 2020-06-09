#!/bin/sh
#
#====================================
# Creation le 14/04/2020
# Par F1PTL Bruno
# Version 3.18
# Modifie le 23/04/2020
# Par F5NLG JEAN-Philippe
#
# Extrait adapte pour le GUI Spotnik
# Le 09/05/2020 par
# F1EVM Jean-Francois
#====================================
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


INDICATIF=$1
dept=$2
IDDMR7=$3
IDDMR9=$4
IDNXDN=$5
MASTER_IP_BM=$6
PORT_HB=$7

cd '/opt/Gestion_Menu'
REP_ICI=`pwd`


for file in ${REP_ICI}/${FIC_REF}/*
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

mv ${REP_ICI}/${FIC_REF} ${REP_ICI}/${FIC_REF}_${INDICATIF}
tar xf ${REP_ICI}/${FIC_REF_TAR}


echo ""
echo "###########################################"
echo "==> Copie des fichiers .ini de ${INDICATIF}"
echo "###########################################"
cd $REP_ICI
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/Analog_Bridge.ini /opt/Analog_Bridge
#echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/Analog_Bridge.ini /opt/Analog_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/dvsm.macro /opt/Analog_Bridge
#echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/dvsm.macro /opt/Analog_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/DVSwitch.ini /opt/MMDVM_Bridge
#echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/DVSwitch.ini /opt/MMDVM_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/MMDVM_Bridge.ini /opt/MMDVM_Bridge
#echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/MMDVM_Bridge.ini /opt/MMDVM_Bridge"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/NXDNGateway.ini /opt
#echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/NXDNGateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/P25Gateway.ini /opt
#echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/P25Gateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/YSFGateway.ini /opt
#echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/YSFGateway.ini /opt"
cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/ircddbgateway /etc
#echo "cp -rf ./Fichiers_Ini_Ref_${INDICATIF}/ircddbgateway /etc"


sleep 2
/etc/spotnik/num.sh start

#read x