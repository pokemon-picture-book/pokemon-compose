## pokemon-compose
### 概要
pokemon-api + pokemon-client + sonarqube + postgres + swagger-editor + swagger-ui + apisprout


### docker 操作手順

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

* トラブルシューティング

docker up 時に、以下のエラーが出力される場合

```
Creating network "pokemon-compose_default" with the default driver
ERROR: Network swagger_link declared as external, but could not be found. Please create the network manually using `docker network create swagger_link` and try again.
```

その場合は、記載のある通りに以下のコマンドを実行する

```
$ docker network create swagger_link
```

### プロセス確認

```
$ docker-compose ps
```

### docker 環境へ ssh

```
$ docker-compose exec <サービス名> bash
```