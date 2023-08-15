# 100knocks-preprocess-ruby
## データサイエンス100本ノック（構造化データ加工編） Ruby(RedAmber)版

このリポジトリは、一般社団法人データサイエンティスト協会が作成している「[データサイエンス100本ノック（構造化データ加工編）](https://github.com/The-Japan-DataScientist-Society/100knocks-preprocess)」の設問とサンプルデータを利用して、Rubyで動くデータフレームライブラリ[RedAmber](https://github.com/red-data-tools/red_amber)による解答例を作成したものです。上記原著のライセンスはMITライセンスであり、当リポジトリもMITライセンスに従います。

オリジナル([データサイエンス100本ノック（構造化データ加工編）](https://github.com/The-Japan-DataScientist-Society/100knocks-preprocess))にから転載したデータ：
- `doc/data`以下のサンプルデータ
- このファイルの、設問タイトル及び設問の内容
オリジナルのライセンスは、MITライセンスです。

ここではRedAmberの設問と解答しか対応していませんが、代わりに次のような特徴があります。

* Apache Arrow を利用した RedAmber が動く Notebook 環境となっています
* 開発コンテナを利用しているため、高速かつ容易に環境の構築ができます
* Quarto を利用して、Jupyter Notebook のソースを qmd フォーマットで管理しています
* Quarto を利用して、pdf 形式で Notebookを出版できます

なお、データに含まれる名前、住所等はダミーデータであり、実在するものではありません。

## インストール方法

### GitHub Codespacesでクラウド上のVMをブラウザから使う方法（簡単）

#### 必要なもの
GitHubアカウントにサインインしている必要があります。

#### 注意
以下の手順では、Codespacesを起動するあなたのアカウントのクォータを消費します。GitHub Freeに対しては120時間/月・コア(2コアでは60時間)、ストレージ15GB/月が無料で使用できます。使用状況については [Billing and plans](https://github.com/settings/billing)のCodespacesの項を参照してください。

#### 手順
- GitHubのこのリポジトリ内の「<>Code」ボタン、「Codespaces」タブにある、「Create codespace on main」ボタンを押して新しいCodespacesを作成してください。
  * 既にCodespacesがある場合は、該当するコンテナ名をクリックすると再接続できます。
- Codespacesの作成には時間がかかります。「View log」をクリックしてぼーっとログを眺めるか、コーヒーを淹れに行くとよいでしょう。
- VS Code for ブラウザでリポジトリが開きます。
- 使い方は、下の[動作させるには](#動作させるには)を参照してください。

### ローカルにクローンしたリポジトリ―からDev Containerを立ち上げ、VS Codeで使う方法（おすすめ）

#### 必要なもの
- Visual Studio Code (October 2020 Release 1.51以降)

  GitHub Codespaces 拡張機能をインストールして、GitHub 資格情報を使用してサインインする必要があります。[GitHub Docs - GitHub Codespaces - 前提条件](https://docs.github.com/ja/codespaces/developing-in-codespaces/using-github-codespaces-in-visual-studio-code#prerequisites)を参照して設定を済ませておいてください。

- Docker
  - Windows

    Windows 10 Pro/Enterprise では Docker Desktop 2.0 以降。
    Windows 10 Home (2004+) では、Docker Desktop 2.3 以降と WSL 2 バックエンド。

  - Mac

    Docker Desktop 2.0 以降

  - Linux

    Docker CE/EE 18.06 以降と Docker Compose 1.21 以降

- Git

#### 手順

- ローカルに 当リポジトリのクローンを作成します。

  ```
  git clone https://github.com/heronshoes/100knocks-preprocess-ruby.git
  ```
  または、GitHub CLIで、
  ```
  gh repo clone heronshoes/100knocks-preprocess-ruby
  ```
  とします。

- 作成したローカルのリポジトリフォルダーをVS Codeで開きます。
  ```
  code 100knocks-preprocess-ruby
  ```

- コンテナーで開く

  今のフォルダーをコンテナーで再度開きます。

  - 左下隅のステータスバーのリモートホスト表示（今はローカルなので「><」の後ろに何もついていない）をクリックするとリモートウィンドウを開くオプションが表示されるので、「コンテナーで再度開く」を選択します。

- コンテナーの構築が開始されます

  最初の構築には、数分かかることがあります。それ以降の構築は高速になります。
  構築が完了すると、左下隅のステータスバーのリモートホスト表示にコンテナー名が表示されます。

- 使い方は、下の[動作させるには](#動作させるには)を参照してください。

### 必要な環境を準備して使う方法

下記の環境が用意されていればたぶん動きます。

* 最近のPython 及び Jupyter Lab
* Ruby 3.0以上
  IRubyカーネルが Jupyterで有効になっていること
  RedAmber 0.5.1以上 (Apache Arrow 12.0.0以上)
* Quarto (Jupyter Notebookを生成するために必要です)


## 動作させるには

### インストールの確認

  ターミナルを開いてください。

  ツールがインストール済みであることを確かめてください。

  ```shell
  ruby -v --jit
  rbenv versions

  python --version
  jupyter --version
  jupyter kenelspec list

  quarto --version
  quarto check

  id
  ```

### Jupyter Notebookファイルを作成する

  下記のコマンドで、`doc/notebook`以下に`ipynb`ファイルが作成されます。

  ```shell
  rake convert
  ```

### Jupyter Labを起動する

  下記のコマンドは、`ipynb`ファイルを作成してから `localhost:8888`でJupyter Labを起動します。

  ```shell
  rake jupyter
  ```

  `preprocess_knock_Ruby-RedAmber.ipynb` ファイルを開き、記載されている指示に従って下さい。

## License
MIT License.
