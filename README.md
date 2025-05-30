
## 準備
公式サイトからlinux版COEIROINKをダウンロードしてきます。<br>
https://coeiroink.com/download

## ディレクトリ構成

プロジェクトルートに以下のようにファイル<br>
を配置します。

```
.
├── Dockerfile
├── start.sh
└── COEIROINK_LINUX_CPU_v.2.11.2/
    ├── engine/
    │   └── engine (実行バイナリ)
    └── 他フォルダ・ファイル
```


## コンテナ立ち上げ方法

環境に応じたDockerビルドと実行コマンドを入力します。<br>
（mac + appleシリコンの場合は、platformを明示的に示す必要があるため、<br>
以下になります。）<br>

```
# ビルド
docker buildx build --platform linux/amd64 --load -t coeiroink-engine-x86

# 実行
docker run -p 50033:50033 -it --platform linux/amd64 coeiroink-engine-x86.
```

## API実行方法

[http://127.0.0.1:50033](http://127.0.0.1:50033)にアクセスすると<br>
APIを呼び出せます。<br>
APIの仕様は以下で確認できます。

https://coeiroink.com/help/002
