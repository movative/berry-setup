# Raspberry PI - Backup Optionen

## Option 2 – Komplette Image Sicherung des RasPi auf USB oder NAS

Der Raspberry Pi kann sich auch selbst als komplettes Image sichern, hierfür ist allerdings ein externer Speicher, wie zum Beispiel ein NAS oder eine angeschlossene USB-Festplatte notwendig. Die Methode basiert auf dem dd Kommando das via Cronjob regelmäßig ausgeführt wird.

**Vorteil**
- Sicherung läuft voll automatisch, die SD-Karte des RasPi wird komplett gesichert, es können mehrere Versionen der Sicherung aufbewahrt werden

**Nachteil**
- Die Image Dateien werden sehr groß und es wird ein zusätzlicher externer Speicher (NAS oder USB) benötigt.
- Anwendungen sollten für eine konsistente Sicherung gestoppt werden, vor allem ist das bei Anwendungen mit Datenbank wichtig.

### Festplatte oder USB Stick Mounten
Zum Mounten eurer Festplatte oder USB-Sticks am Raspberry Pi (siehe Step 1) gibt es bereits ein Tutorial. Falls ihr eine USB-Platte ohne eigene Stromversorgung verwenden möchtet gibt es einen speziellen Tick um diese ans Laufen zu bekommen. Als Alternative zur Festplatte könnt ihr z.B. auch das FritzBox NAS als Speicher verwenden. Backup auf dem Raspberry Pi einrichten Wir erstellen unser Backup Script mit nano im Home des Benutzers pi

```
sudo nano /home/pi/Backup.sh 
```

Das Script erhält folgenden Inhalt, die Variablen müssen unbedingt angepasst werden 

- BACKUP_PFAD – Pfad zu eurer gemounteten Festplatte oder NAS Share • BACKUP_ANZAHL – Wie lange sollen alte Sicherungen aufbewahrt werden (Anzahl Versionen)
- BACKUP_NAME – Name der Sicherung
- DIENST_START_STOP – Dienste die vor dem Backup gestoppt und dann wieder gestartet werden Wir machen die Datei noch ausführbar und verschieben Sie dann nach /usr/local/bin

```
sudo chmod 755 /home/pi/Backup.sh
sudo mv /home/pi/Backup.sh /usr/local/bin/Backup.sh
```

Um die Sicherung regelmäßig auszuführen erstellen wir via crontab noch einen Job sudo crontab -e In einer neuen Zeile definieren wir den Job und speichern mit STRG+X, Y und Ebter 00 01 * * 0 /usr/local/bin/Backup.sh Hiermit wird jeden Tag um 01:00Uhr die Sicherung gestartet.
Zum Wiederherstellen auf eure SD-Karte verwendet ihr unter Windows entweder Win32
Disk Imager ode runter Linux folgender Befehl, sda muss entsprechend eure SD-Karte
sein
dd if=/pfad/backup.img of=/dev/sda bs=1MB
