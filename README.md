# 概要
コンテナ内でプロセスのライブマイグレーションを行うテスト

# 構成
```
frontend
 \_ /bin/bash
     \_ ruby frontend.rb
frontend2 
 \_ tail -f /dev/null
backend 
 \_ /bin/bash
     \_ backend.rb
zipkin
 \_ ZipkinServer

```

# 説明
frontendサーバからbackendサーバにGetリクエスト送るプログラムを動かしている．それぞれ，frontendコンテナとbackendコンテナで走行．
また，サービス間通信をZipkinを用いてトレースしている．
frontend2は，/dev/nullを読み続けて常駐させている．
本スクリプトでは，frontendコンテナのfrontend.rbをfrontend2にマイグレーションする．

frontend でphaul-client，backendでphaul-serverが実行してライブマイグレーションが実行される．
```
frontend
 \_ /bin/bash
     \_ ruby frontend.rb
 \_ phaul-client
frontend2 
 \_ tail -f /dev/null
 \_ phaul-server
backend 
 \_ /bin/bash
     \_ backend.rb
zipkin
 \_ ZipkinServer

```
# 使い方
```
$ docker build -t phaul-in-container ./contents
$ ./run.sh
```

# 動作確認
frontendのサーバは，以下を実行するとなんか帰ってくる
```
$ curl http://localhost:8081
```
frontend2のサーバは，以下を実行するとなんか帰ってくる
```
$ curl http://localhost:8082
```

# イメージサイズ
+ 全体
1.19GB
+ CRIUと関連パッケージ
？？
+ PHAUL
26MB
+ メイン
??


# その他
よく失敗する
+ PIDがかぶっていたりとか
+ 原因よくわからんやつとか



