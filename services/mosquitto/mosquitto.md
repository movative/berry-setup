# Mosquitto
<img src="mosquitto.png" alt="Raspberry Icon" align="left" height="80" width="80" vspace="6"/>

Eclipse Mosquitto is an open source (EPL/EDL licensed) message broker that implements the MQTT protocol versions 5.0, 3.1.1 and 3.1. Mosquitto is lightweight and is suitable for use on all devices from low power single board computers to full servers.
[[Logo created with diagram.net]](https://app.diagrams.net/)<br><br>

## Install Steps

1. OpenHAB User erstellen

```bash
sudo useradd -r -s /sbin/nologin mosquitto
```

2. User der OpenHAB Gruppe hinzufügen

```bash
usermod -a -G mosquitto <user>
```
3. Mosquitto Ordner anlegen

```bash
mkdir /opt/mosquitto
mkdir /opt/mosquitto/conf
chown -R mosquitto:mosquitto /opt/mosquitto
```

4. Erstelle Docker Volume

```bash
docker volume create mosquitto_data
```

5. Starte Container
```bash
docker run -d --name mosquitto --restart on-failure -p 1883:1883 -p 9001:9001 -v /opt/mosquitto/config/mosquitto.conf:/mosquitto/config/mosquitto.conf -v mosquitto_data:/mosquitto/data -v mosquitto_data:/mosquitto/log eclipse-mosquitto
```