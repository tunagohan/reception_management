# Reception Management(受付システム)

## 開発環境構築手順

### 環境変数の構築

- direnv などで環境変数をセット(docker-compose.ymlに入れるため)

```
export APP_PORT=3001
export DB_PORT=3307
export APP_DATABASE_USERNAME=reception_user
export APP_DATABASE_PASSWORD=reception_password
```

- docker-envにて環境変数をセット(rails本体へ流し込むためのenv)

```
$ cp docker/ruby/docker-env.example docker/ruby/docker-env
```
