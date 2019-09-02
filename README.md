## pokemon-compose
### 概要
pokemon-api + pokemon-client + sonarqube + postgres + swagger-editor + swagger-ui + apisprout


### 起動

* クローン

```
$ git clone https://github.com/pokemon-picture-book/pokemon-compose.git
```

* up

```
$ docker-compose up -d
or
$ docker-compose up --build --remove-orphans
```

* down

```
$ docker-compose down && docker system prune -a
```

### プロセス確認

```
$ docker-compose ps
```

### docker 環境へ ssh

```
$ docker-compose exec <サービス名> bash
```