# Bookstack
<img src="bookstack.png" alt="Bookstack Icon" align="left" height="80" width="80" vspace="6">

BookStack is a simple, self-hosted, easy-to-use platform for organising and storing information.<br>
If wiki.js is may a bit to complex for you, i recommend you bookstack.<br>
Usage is optional.<br>
[[Logo created with diagram.net]](https://app.diagrams.net/)<br><br>


```
docker create --name=mariadb --network home -e MYSQL_ROOT_PASSWORD=mariadb -e TZ=Europe/Berlin -e MYSQL_DATABASE=mariadb -e MYSQL_USER=mariadb -e MYSQL_PASSWORD=mariadb -p 3306:3306 -v /config/mariadb --restart unless-stopped linuxserver/mariadb
docker start mariadb
docker create --name=bookstack --network home -e DB_HOST=mariadb:3306 -e DB_USER=mariadb -e DB_PASS=mariadb -e DB_DATABASE=mariadb -p 6875:80 -v /config/bookstack --restart unless-stopped linuxserver/bookstack

docker start bookstack
# Erreichbar unter http://c3g0.local:6875/
```