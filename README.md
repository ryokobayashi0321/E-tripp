# E-tripp

<img width="1680" alt="new_top_e-tripp" src="https://user-images.githubusercontent.com/80377991/128181948-5bea8e9e-9e98-417d-947d-386566e5f575.png">

<br>

# サイトURL 

### https://arcane-forest-90597.herokuapp.com/

<br>

# 💡制作背景
### 課題
- 旅行プランを作る際、色々なサイトを探して決めるが、どれも複雑でプランを作るのが大変とパートナーが不満にしていました。**もっと簡単に計画を作りたい**という要望を叶えたいと思いこのアプリを制作しました。

### 解決方法
- 時間や場所をクリックで選択するだけで、登録できるようにする。
- タイムラインですぐに確認できるようにする。

### 目的
- 簡単に旅行プランを作れるようにする。
- パートナーの**要望を叶える、笑顔にさせる**
- 継続的なサービス展開(ビジネス)

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

# 🗻トップページ
![new_top_e-tripp](https://user-images.githubusercontent.com/80377991/128181304-baf6befb-0431-4b8c-b563-93499749a395.gif)

<br>

# 🗾開発で工夫したこと
- ただ作成するのではなく、**現場を意識してdevelopからブランチを切り最後にmasterでデプロイをする開発工程**で行いました。

- また、だらだら作っていてはいつまで経っても転職活動ができないと考え、自分で**納期日(完成予定日)と、工程をAプラン(終わったら転職活動スタート)・Bプラン(転職活動中)と分けて取り組む**ようにしました。以下はAプランの実装です。

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
![create_plan](https://user-images.githubusercontent.com/80377991/128182277-4eb5fc2c-5677-4fc2-b679-ac3530dde8e4.gif)

## 💪【工夫した点】
### ①プランに複数のスポットを追加可能に
- ユーザーが**複数のスポットを登録**できるようにするために、スポットのフォームを追加できるよう実装しました。
- **時間も一緒**に登録できるようにしました。

### ②既存のスポットをセレクトボックスで選択
- ユーザーの**入力負担を減らす**ために、スポットをセレクトボックスで選択できるよう実装しました。
- **今後は画像をクリックで登録**できるよう実装していきたいと考えています。


<br>

# 🔍プラン詳細画面
![index_plan](https://user-images.githubusercontent.com/80377991/128182418-9763b77d-f833-49e9-995f-b6ddd4ab0239.gif)

## 💪【工夫した点】
### ①プランが見やすいようタイムライン化
- ユーザーが**すぐに時間と場所を確認**できるようにするために、表示をタイムライン化で実装しました。
- 編集機能で順番を入れ替えることもできるようにしました。

### ②画像をクリックでスポット詳細ページへ
- ユーザーがすぐに場所の情報を知るために、**行く場所をクリックすることで詳細ページに移動**できるよう実装しました。


<br>

# 🏰スポット詳細画面
![show_spot](https://user-images.githubusercontent.com/80377991/128182544-96271693-ca5a-4e02-bd57-a57c3a72f811.gif)

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

## 🧐【苦労した点】
### 多対多のアソシエーション
- 今回一番苦労しました。１対多のアソシエーションはすぐに理解する事ができたのですが、多対多のアソシエーションに一番時間を費やしました。中間テーブルによってどっちが複数持てるのか、外部キーはどこが所有するのか等、非常に迷いました。解決策として**やりたいことを図や絵や言葉で表現**(例；plan→schedule→spot)しながら進めていくことで、無事に解決する事ができました。


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









