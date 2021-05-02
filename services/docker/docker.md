# Docker
<img src="docker.png" alt="Docker Icon" align="left" height="80" width="80" vspace="6"/>

Docker simplifies and accelerates the development workflow with an integrated dev pipeline and through the consolidation of application components. We use it to isolate each application environment.<br>
[[Logo created with diagram.net]](https://app.diagrams.net/)<br><br>

## Installation und nutzen als Swarm
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
