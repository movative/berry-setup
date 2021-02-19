# Beginners Guide

## How to flash a SD-Card for a Raspberry PI

1. Install Raspberry Pi Imager [[here]](https://www.raspberrypi.org/software/)
1. Insert a SD-Card, I recommend minimum a Class 10 Card for better performance.
1. Choose your OS, I recommend a Raspberry Pi OS Lite (32-bit) and flash it onto the SD-Card.

## What`s next?
After successfully flashing the SD-Card we have two options to configure and access the raspberry:
1. Via keyboard and display
    - If you want to access the pi via keyboard and display you can stop reading now and just insert the sd-card into the raspberry, but just saying the ssh option is much more comfortable.
1. Via SSH
    - If you want to use SSH, we must first enable it and have network access to the raspberry pi, so follow the next steps.

### Enable SSH
1. Re-insert the card into your computer.
2. Create an empty file with the name **SSH** at **/boot**.

This tells the raspberry pi at booting to enable ssh.

### Network Access to the Raspberry Pi.
To access the raspberry pi via network you can just plugin a ethernet cable or preconfigure wifi settings on the sd-card just with the following steps.

1. Create **wpa_supplicant.conf** on **/boot**.

```ini
country=DE
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
network={
    ssid="wifi"
    psk="password"
    key_mgmt=WPA-PSK
}
```
Now the sd-card is ready to be inserted into the pi.

### How to find the raspberry pi in local area network
The following steps requires, that you have ssh to access and the Bonjour Service to resolve Hostnames installed. 

1. In the standard installation of the raspberry os, the raspberry has the hostname `raspberrypi.local` so you can now connect to it via `ssh pi@raspberrypi.local` and the passwort `raspberry`.

Alternativly you can use `arp -a` to show every ip-address on your local network and try every ip address.

## Finally
You should alter the standard password with `sudo passwd` and you can alter the default hostname.

```bash
sudo hostname movative
sudo sed -i 's/raspberrypi/movative/g' /etc/hosts
hostnamectl set-hostname movative
```
