#!/bin/sh
sudo hostname movative
sudo sed -i 's/raspberrypi/movative/g' /etc/hosts
hostnamectl set-hostname movative