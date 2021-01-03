#!/bin/sh

# VARIABLEN - HIER EDITIEREN
BACKUP_PFAD="/bckp"
BACKUP_ANZAHL="1"
BACKUP_NAME="BerryPiBackup"
DIENSTE_START_STOP="service mysql"
TIME=$(date +%Y\;%m\;%dT%H\;%M\;%S)
# ENDE VARIABLEN

# Stoppe Dienste vor Backup
#${DIENSTE_START_STOP} stop

# Backup mit Hilfe von dd erstellen und im angegebenen Pfad speichern
dd if=/dev/mmcblk0 | gzip > ${BACKUP_PFAD}/${BACKUP_NAME}_${TIME}.img.gz | pv

# Starte Dienste nach Backup
#${START_SERVICES} start

# Alte Sicherungen die nach X neuen Sicherungen entfernen
pushd ${BACKUP_PFAD}; ls -tr ${BACKUP_PFAD}/${BACKUP_NAME}* | head -n -${BACKUP_ANZAHL} | xargs rm; popd

#rclone -v move ${BACKUP_PFAD}/${BACKUP_NAME}_${TIME}.img.gz gdrive:bckp
