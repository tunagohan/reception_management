# Reception Management(受付システム)

## 開発環境構築手順

### 環境変数の構築

- direnv などで環境変数をセット(docker-compose.ymlに入れるため)

username や password は 適宜変更してください

```
export APP_PORT=3001
export DB_PORT=3307
export APP_DATABASE_USERNAME=reception_user
export APP_DATABASE_PASSWORD=reception_password
```

- config/database.ymlの編集

username と password は上で設定したものを設定してください。

(※ rootでも可能です。)

```
default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: reception_user
  password: reception_password
  host: db
```

上記で設定したuserで作成した際に権限が無い為作れないと言われた場合(上記で言うreception_user)、権限はおそらくデフォルトでは無いはずなので以下のコマンドを流すと良いです。

```
$ docker-compose run --rm db mysql -uroot -proot_password -e "CREATE USER reception_user IDENTIFIED BY 'reception_password';"
$ docker-compose run --rm db mysql -uroot -proot_password -e "GRANT ALL ON *.* TO 'reception_user'@'%' IDENTIFIED BY 'reception_password';"
$ docker-compose run --rm db mysql -uroot -proot_password -e "FLUSH PRIVILEGES;"
```

### 環境を立ち上げる

```
$ docker-compose build
$ docker-compose up -d
$ docker-compose run app rails db:create
$ docker-compose run --rm app bundle install --path vendor/bundle
```

### アクセス

http://localhost:app_port番号
