# raspi-setup 
This project contains the documentation of my raspberry pi projects.

This includes self written software and external software used via docker-compose file.

For more information you can read the wiki [@here](https://gitlab.com/movative/raspi-setup/-/wikis/home).

# What you have to do
1. Choose Raspberry OS
1. Configure OS
1. Curl the script
1. Execute install.sh

# What happens
1. Installations Script
1. Install Git and Docker && Git pull
1. Docker Service: Portainer
1. Docker Service: Bookstack
1. Docker Service: OpenHAB

<details>
  <summary>My Hardware Setup</summary>

  # Used Raspberry PI Pin's

  <img src="https://gitlab.com/movative/raspi-setup/-/raw/master/docs/raspberry_pi_c3g0.png" height="800" />

  ## Heading
  1. A numbered
  2. list
     * With some
     * Sub bullets
</details>


<details>
  <summary>Beginners Guide</summary>

    #How to flash a Raspberry PI

    1. Download Raspbian from [https://www.raspberrypi.org/downloads/raspbian/](https://www.raspberrypi.org/downloads/raspbian/)
    2. Flash SD-Card with [https://www.balena.io/etcher/](https://www.balena.io/etcher/)
    3. Re-insert card and create an empty file with the name **SSH** **/boot**.
    4. Create **wpa_supplicant.conf** on **/boot**.

    ```
    country=DE
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    update_config=1
    network={
        ssid="wifi"
        psk="password"
        key_mgmt=WPA-PSK
    }
    ```

    5. SD-Karte auswerfen und im Raspberry PI einstecken. Wenn der Bonjour Service auf Ihrem Rechner installiert ist, kann man sich mit `ssh pi@raspberrypi.local `auf den PI verbinden.

    6. Passwort ändern
    ```
    sudo passwd
    ```

    7. Hostname ändern
    ```
    sudo hostname c3g1
    sudo sed -i 's/raspberrypi/c3g1/g' /etc/hosts
    hostnamectl set-hostname c3g1
    ```

    8. Install Docker
    ```
    apt-get install docker.io
    ```

    9. Add pi user to docker group
    ```
    sudo usermod -aG docker pi
    ```

    10. Init Docker Swarm
    ```
    sudo docker swarm init --advertise-addr <pi-ip-address>
    ```
    Eine Ähnliche Ausgabe wird entstehen, mit diesem Code kann ein anderer Node dem Cluster hinzugefügt werden:
    ```
    docker swarm join \
            --token SWMTKN-1-49nj1cmql0jkz5s954yi3oex3nedyz0fb0xx14ie39trti4wxv-8vxv8rssmk743ojnwacrr2e7c \
        192.168.1.181:2377
    ```
    Mit folgendem Befehl werden die im Schwarm enthaltenen Knoten ausgegeben
    ```
    sudo docker node ls
    ```

    11. Install Docker Compose
    ```
    sudo apt-get install libffi-dev libssl-dev
    sudo apt-get install -y python python-pip
    sudo apt-get remove python-configparser
    sudo pip install docker-compose
    ```
</details>

