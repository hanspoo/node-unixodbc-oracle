# POC node unixodbc with oracle

git clone xxx
cd xxx

## Start Oracle Server

`docker compose up`

## Build node app with unixodbc and oracle drivers

```
docker build --no-cache -t torpedo-base -f Dockerfile .
docker build --no-cache -t torpedo:1.0 -f Dockerfile.odbc .
```

## Execute the node app

`docker run -it --rm torpedo:1.3 `
