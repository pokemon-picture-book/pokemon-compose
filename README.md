## pokemon-compose
### 概要
pokemon-api + pokemon-client + sonarqube + postgres + swagger-editor + swagger-ui + apisprout


### docker 操作手順

* クローン

```
$ git clone https://github.com/pokemon-picture-book/pokemon-compose.git
```

* Makefile 操作
```
# プロセス確認
make ps

# ローカル開発
$ make rebuild
$ make up
$ make down

# 本番環境
$ make rebuild e=prod
$ make up e=prod
$ make down e=prod
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

### docker 環境へ ssh

```
$ docker-compose exec <サービス名> bash
```