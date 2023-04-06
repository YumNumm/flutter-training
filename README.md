# 株式会社ゆめみ 研修課題

## 環境構築

```bash:install.sh
# リポジトリをクローン
git clone https://github.com/YumNumm/flutter-training.git
cd flutter-training

# FVMをインストール
brew tap leavjenn/tap
brew install fvm
fvm use


# Lefthookをインストール(コミット時にフォーマットを実行するため)
brew install lefthook
lefthook install

# パッケージをインストール
fvm flutter pub get
```
