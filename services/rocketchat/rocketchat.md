# Rocket.Chat
<img src="rocketchat.png" alt="Raspberry Icon" align="left" height="80" width="80" vspace="6">

Rocket.Chat is a open source communication platform.
Usage is optional, but if you want an own Rocket.Chat server you can use this compose files.
[[Logo created with diagram.net]](https://app.diagrams.net/)<br><br>


## Install

```
docker run -d --name mongo --restart unless-stopped -v /data/db:/data/db -v /data/configdb:/data/configdb -p 27017:27017 -p 28017:28017 andresvidal/rpi3-mongodb3:latest

http://c3g0.local:6875/link/8#bkmrk-docker-run---name-ro
 
docker run --name rocketchat -p 80:3000 --env ROOT_URL=http://localhost --env MONGO_URL=mongo://mymongourl/mydb -d rocket.chat
```