# E-tripp

<br>

# サイトURL 

### https://arcane-forest-90597.herokuapp.com/

<br>

### Qiita解説記事　:

<br>

# 🗾はじめに
- 今回のこのポートフォリオは**転職を目的**として作成しました。ただ作成するのではなく、**現場を意識してdevelopからブランチを切り最後にmasterでデプロイをする開発工程**で行いました。

- また、だらだら作っていてはいつまで経っても転職活動ができないと考え、自分で**納期日(完成予定日)と、工程をAプラン(終わったら転職活動スタート)・Bプラン(転職活動中)と分けて取り組む**ようにしました。以下はAプランの実装です。

<br>

# 🗺アプリ概要
- クリックするだけで簡単に旅行プランを制作できるアプリ

<br>

# 💻開発環境

- Ruby 2.7.3
- Ruby on Rails 6.1.3
- PostgreSQL 13.2(DB)
- Github
- Visual Studio Code
- JavaScript
- jQuery
- Heroku

<br>

# 💡制作背景
### 課題
- 旅行プランを作るのに、色々なサイトを探して決めるのが大変とパートナーが不満にしていました。そして簡単に計画を作りたいという要望を叶えたいと考えました。

### 解決方法
- 時間や場所をクリックで選択、登録し簡単スケジュール化

### 目的
- 簡単に旅行プランを立てる
- パートナーの**要望を叶える、笑顔にさせる**
- 継続的なサービス展開(ビジネス)

<br>

# 🗻トップページ
![E-tripp_top](https://user-images.githubusercontent.com/80377991/125796420-ff0cc0a9-24cf-4316-8169-405a2c1af82c.gif)

<br>

# ✈️実装機能

|  | 機能 | Gem |
| :-: | :-: | :-: |
| ① | ログイン機能 | devise |
| ② | ゲストログイン機能 | ✖︎ |
| ③ | プラン作成機能(CRUD) | cocoon |
| ④ | いいね機能(Ajax) | ✖︎ |
| ⑤ | いいねカウント機能(Ajax) | ✖︎ |
| ⑥ | コメント機能(Ajax) | ✖︎ |
| ⑦ | 検索機能 | ransack |
| ⑧ | ページネーション機能 | kaminari |
| ⑨ | 画像アップロード機能　　| carriewave |
| ⑩ | 管理者機能 | activeadmin |

<br>

# 🗓プラン作成画面
![plan](https://user-images.githubusercontent.com/80377991/125779845-6398774c-7f9d-4c4e-9b32-aabbe90890a6.gif)

## 💪【工夫した点】
### ①プランに複数のスポットを追加可能に
- ユーザーが**複数のスポットを登録**できたら良いと思い、スポットのフォームを追加できるよう実装しました。
- **時間も一緒**に登録できます。

### ②既存のスポットをセレクトボックスで選択
- ユーザーの**入力負担を減らそう**と思い、スポットをセレクトボックスで選択できるよう実装しました。
- **今後は画像をクリックで登録**できるよう実装していきたいと考えています。


<br>

# 🔍プラン詳細画面
![plan_show](https://user-images.githubusercontent.com/80377991/125780905-0bc78667-f34e-4d02-b95f-addd9847a1b0.gif)

## 💪【工夫した点】
### ①プランが見やすいようタイムライン化
- ユーザーが**すぐに時間と場所を確認**できたらいいと思い、タイムライン化で実装しました。
- 編集機能で順番を入れ替えることもできます。

### ②画像をクリックでスポット詳細ページへ
- ユーザーはすぐに場所の情報を知りたいと思い、**行く場所をクリックすることで詳細ページに移動**できるよう実装しました。


<br>

# 🏰スポット詳細画面
![spot_list](https://user-images.githubusercontent.com/80377991/125780437-aa016554-3f46-4b03-b6aa-8e5b9d6cd043.gif)

## 💪【工夫した点】
### ①いいねボタンとコメント機能をAjax化
- いいねボタンとコメント機能を**Ajax化**したことで、ページが切り替わる時の**ユーザーの待ち時間とサーバーへの負担を減す**ようにしました。

<br>

# ⚙️使用したGem

- gem "activeadmin"
- gem "bootsnap", ">= 1.4.4", require: false
- gem "bootstrap-sass", "3.3.6"
- gem "carrierwave", "~> 2.0"
- gem "cocoon"
- gem "devise"
- gem "devise-bootstrap-views", "~> 1.0"
- gem "devise-i18n"
- gem "jbuilder", "~> 2.7"
- gem "jquery-rails"
- gem "kaminari"
- gem "pg", "~> 1.1"
- gem "puma", "~> 5.0"
- gem "rails", "~> 6.1.3", ">= 6.1.3.2"
- gem "rails-i18n", "~> 6.0"
- gem "ransack"
- gem "sass-rails", ">= 6"
- gem "turbolinks", "~> 5"
- gem "webpacker", "~> 5.0"

### 開発環境

- gem "factory_bot_rails"
- gem "faker"
- gem "pry-byebug"
- gem "pry-doc"
- gem "rails_best_practices"
- gem "rspec-rails"
- gem "rubocop-performance", require: false
- gem "rubocop-rails", require: false

<br>

# ✏️ER図
<img width="940" alt="ER図" src="https://user-images.githubusercontent.com/80377991/125774810-ee446f91-3312-43b1-b061-dff96ddb2509.png">

<br>

# 🗒テーブル設計

### usersテーブル（ユーザー情報を管理するテーブル）
| カラム | データ型 | 備考 |
| :-: | :-: | :-: |
| user_id | integer | PK |
| user_name | string |  |
| email | string |  |
| password | string |  |
| password_cnfirmation | string |  |
| avatar | string |  |

### plansテーブル（ユーザーが作成したプランを管理するテーブル）
| カラム | データ型 | 備考 |
| :-: | :-: | :-: |
| plan_id | integer | PK |
| user_id | integer | FK |
| title | date |  |
| note | text |  |

### schedulesテーブル（planの時間を管理するテーブル）
| カラム | データ型 | 備考 |
| :-: | :-: | :-: |
| time_id | integer | PK |
| plan_id | integer | FK |
| spot_id | integer | FK |
| specified_time | time |  |

### spotsテーブル（観光地のデータを管理するテーブル）
| カラム | データ型 | 備考 |
| :-: | :-: | :-: |
| spot_id | integer | PK |
| prefecture_id | integer | FK |
| spot_name | string |  |
| content | text |  |
| photo | string |  |
| likes_count | integer |  |

### prefecturesテーブル（都道府県のテーブル）
| カラム | データ型 | 備考 |
| :-: | :-: | :-: |
| prefecture_id | integer | PK |
| prefecture_name | string |  |

### commentsテーブル（ユーザーのスポットに対するコメントを管理するテーブル）
| カラム | データ型 | 備考 |
| :-: | :-: | :-: |
| comment_id | integer | PK |
| user_id | integer | FK |
| spot_id | integer | FK |
| comment | text |  |

### likesテーブル（spotsに対するいいね）
| カラム | データ型 | 備考 |
| :-: | :-: | :-: |
| like_id | integer | PK |
| user_id | integer | FK |
| spot_id | integer | FK |

<br>

# 💪今後実装予定(Bプラン)

- テスト(Rspec)
- N+1問題
- AWSへデプロイ
- 無限スクロール機能
- タグ機能
- 無限スクロール機能
- ページネーションのAjax化
- 画像をクリックしたらフォームに登録できる機能









