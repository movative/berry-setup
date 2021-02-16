# Beginners Guide

## How to flash a Raspberry PI

1. Download Raspbian from [https://www.raspberrypi.org/downloads/raspbian/](https://www.raspberrypi.org/downloads/raspbian/)
1. Flash SD-Card with [https://www.balena.io/etcher/](https://www.balena.io/etcher/)
1. Re-insert card and create an empty file with the name **SSH** **/boot**.
1. Create **wpa_supplicant.conf** on **/boot**.

```json
country=DE
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
    ssid="wifi"
    psk="password"
    key_mgmt=WPA-PSK
}
```

1. SD-Karte auswerfen und im Raspberry PI einstecken. Wenn der Bonjour Service auf Ihrem Rechner installiert ist, kann man sich mit `ssh pi@raspberrypi.local `auf den PI verbinden.

1. Passwort ändern `sudo passwd`

1. Hostname ändern

```bash
sudo hostname c3g1
sudo sed -i 's/raspberrypi/c3g1/g' /etc/hosts
hostnamectl set-hostname c3g1
```

1. Install Docker `apt-get install docker.io`
1. Add pi user to docker group `sudo usermod -aG docker pi`
1. Init Docker Swarm `sudo docker swarm init --advertise-addr <pi-ip-address>`

Eine Ähnliche Ausgabe wird entstehen, mit diesem Code kann ein anderer Node dem Cluster hinzugefügt werden:

```bash
docker swarm join \
        --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
    192.168.1.181:2377
```

Mit folgendem Befehl werden die im Schwarm enthaltenen Knoten ausgegeben: `sudo docker node ls`

1. Install Docker Compose

```bash
sudo apt-get install libffi-dev libssl-dev
sudo apt-get install -y python python-pip
sudo apt-get remove python-configparser
sudo pip install docker-compose
```
