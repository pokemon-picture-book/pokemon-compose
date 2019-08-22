## pokemon-compose
### 概要
pokemon-api + pokemon-client + sonarqube + postgres + swagger-editor + swagger-ui + apisprout


### 起動

* クローン

```
https://github.com/pokemon-picture-book/pokemon-compose.git
```

* up

```
docker-compose up -d
```

* down

```
docker-compose down && docker system prune -a
```

### プロセス確認

```
docker ps
```

### docker 環境へ ssh

```
docker-compose exec <サービス名> bash
```