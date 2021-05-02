# WikiJs
<img src="wikijs.png" alt="Raspberry Icon" align="left" height="80" width="80" vspace="6">

WikiJs is a powerful and extensible open source Wiki software.<br>
Usage is optional.<br>
[[Logo created with diagram.net]](https://app.diagrams.net/)<br><br>

## Usage

```
docker run --name postgres --network wikijs -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres -d -p 5432:5432 postgres
```

```
docker run -d -p 8080:3000 --network wikijs --name wiki --restart unless-stopped -e "DB_TYPE=postgres" -e "DB_HOST=postgres" -e "DB_PORT=5432" -e "DB_USER=postgres" -e "DB_PASS=postgres" -e "DB_NAME=postgres" requarks/wiki:beta
```
