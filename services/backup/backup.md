# Backup

Der Raspberry Pi kann sich auch selbst als komplettes Image sichern, hierfür ist allerdings ein externer Speicher, wie zum Beispiel ein NAS oder eine angeschlossene USB-Festplatte notwendig.

- Sicherung läuft voll automatisch
- Es können mehrere Versionen aufbewahrt werden
- Es sollen nur Daten gesichert werden welche es auch Wert sind gesichert zu werden und nicht jede X Beliebige Log Datei.

## Option 1 - RCLONE

Docker Container verwenden oder selber bauen.
docker-compose

```bash
wget https://downloads.rclone.org/rclone-current-linux-arm.zip
unzip rclone-current-linux-arm.zip
sudo cp rclone-v1.41-linux-arm/rclone /usr/local/bin/
```

`sudo /usr/local/bin/rclone -v move /home/pi/some_project_data remote:rclone --delete-after --include *.jpg --include *.log`

## Option 2 – Lokales NAS
