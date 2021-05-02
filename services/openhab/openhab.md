# OpenHAB
<img src="openhab.png" alt="Docker Icon" align="left" height="80" width="80" vspace="6"/>

OpenHab is a vendor and technology agnostic open source automation software for your home. We use it in this project to glue all parts together.<br>
[[Logo created with diagram.net]](https://app.diagrams.net/)<br><br>

## Install

1. Create OpenHab user
```bash
sudo useradd -r -s /sbin/nologin openhab
```

2. Add the user to openhab group

```bash
usermod -a -G openhab <user>
```

3. Make directories
```bash
mkdir /opt/openhab
mkdir /opt/openhab/conf
mkdir /opt/openhab/userdata
mkdir /opt/openhab/addons
chown -R openhab:openhab /opt/openhab
```
4. Start OpenHAB

```bash
docker run \
        --name openhab \
        --net=host \
        -v /etc/localtime:/etc/localtime:ro \
        -v /etc/timezone:/etc/timezone:ro \
        -v openhab_addons:/openhab/addons \
        -v openhab_conf:/openhab/conf \
        -v openhab_userdata:/openhab/userdata \
        -e "EXTRA_JAVA_OPTS=-Duser.timezone=Europe/Berlin" \
        -d \
        --restart=always \
        openhab/openhab:2.4.0
```

## ToDo
* OpenHAB
   * Items hinzufügen
   * Things hinzufügen
   * Actions hinzufügen