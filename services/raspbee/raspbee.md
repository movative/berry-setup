# RaspBee
<img src="raspbee.png" alt="Raspberry Icon" align="left" height="80" width="80" vspace="6">

The RaspBee Module from [Phoscon](https://phoscon.de/) gives our raspberry pi connectivity with [zigbee](https://zigbeealliance.org/solution/zigbee/) devices.<br>
[[Logo created with diagram.net]](https://app.diagrams.net/)<br>
Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>


* https://www.dresden-elektronik.de/funktechnik/service/downloads/software/
* https://www.dresden-elektronik.de/fileadmin/Downloads/Dokumente/Produkte/ZLL/RaspBee-BHB-en.pdf
* https://phoscon.de/de/raspbee/install
* https://phoscon.de/de/raspbee/install#raspbian
* https://phoscon.de/de/raspbee/install#docker
* https://phoscon.de/de/app/doc
* https://www.dresden-elektronik.de/funktechnik/service/downloads/software/
* https://www.dresden-elektronik.de/fileadmin/Downloads/Dokumente/Produkte/ZLL/RaspBee-BHB-en.pdf
* https://phoscon.de/de/raspbee/install#docker
* https://phoscon.de/de/app/doc

Im Folgendem wird beschrieben wie der deCONZ Container auf einem Linux Hostsystem gestartet wird.

Zugriffsrechte der seriellen Schnittstelle für Nutzer setzen
sudo raspi-config
Interfacing Options → Serial

Would you like a login shell accessible over serial? → No
Would you like the serial port hardware to be enabled? → Yes
Hinweis: Die Zugriffsrechte werden erst nach einem Neustart aktiv.

Verzeichnis für persistente Konfiguration erstellen
mkdir -p /opt/deCONZ

deCONZ Docker Container starten

  docker run -d --restart=always --name=deconz -p 1337:1337 -p 4443:4443 -v /opt/deCONZ:/root/.local/share/dresden-elektronik/deCONZ --device=/dev/ttyAMA0 -e DECONZ_DEVICE=/dev/ttyAMA0 -e DECONZ_WEB_PORT=1337 -e DECONZ_WS_PORT=4443 -e DEBUG_INFO=1 -e DEBUG_APS=1 -e DEBUG_ZCL=1 -e DEBUG_ZDP=1 -e DEBUG_OTAU=1 marthoc/deconz


Nun können die ersten Zigbee Geräte über die Phoscon App angelernt werden. Weitere Informationen hierzu gibt es in der Phoscon App Dokumentation.

Eine Beschreibung aller verfügbaren Parameter, sowie die Verwendung von Docker-Compose und VNC-Zugriff auf die deCONZ GUI ist in der Container Dokumentation zu finden.
