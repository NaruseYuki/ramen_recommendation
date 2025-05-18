# ramen_recommendation

ラーメン画像を分類し、近くのおすすめラーメン店を検索できるFlutterアプリです。

## 概要

- 画像認識AI（TFLite）でラーメンの種類を判定
- 現在地や分類結果に基づきGoogle Places APIでラーメン店を検索
- お気に入り店舗の登録・管理
- レビューや店舗詳細の閲覧

## 主な機能

- カメラ・ギャラリーから画像を選択し、ラーメンの種類を自動判定
- 付近のラーメン店を検索し、詳細情報やレビューを表示
- お気に入り店舗の追加・削除・一覧表示
- 店舗の地図表示やWebサイトへの遷移

## セットアップ

### 1. 必要な環境

- Flutter 3.27.1 以上
- Dart 3.6.0 以上
- Android/iOS エミュレータまたは実機

### 2. 依存パッケージのインストール

```sh
flutter pub get
```

### 3. APIキー・環境変数の設定

Google Places API のAPIキーを `.env.dev` / `.env.prod` を作成し記載してください。

```
GOOGLE_PLACES_API_KEY=your_api_key_here
```

### 4. ディレクトリ構成

```
lib/
    models/         # データモデル
    services/       # API・DB・AIサービス
    viewmodels/     # 状態管理・ビジネスロジック
    views/
        screens/      # 各画面
assets/           # 画像・モデルファイル
test/             # テストコード
```

### 5.開発・テスト

- 単体テストは test/ ディレクトリに配置
- Riverpodによる状態管理
- MVVMアーキテクチャ


### 6.ライセンス

- MIT

### 7.その他

- [Flutter公式ドキュメント](https://docs.flutter.dev/)
- [Google Places API](https://developers.google.com/maps/documentation/places/web-service/overview)

