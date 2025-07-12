# アプリケーション名
  面会予約アプリ  appointment

# アプリケーション概要
  インターネット上で面会予約ができる。

# URL
  https://appointment-amm6.onrender.com

# Basic認証
  ID : 9admin0
  password : 19900509

# テスト用アカウント
  スタッフ
    メールアドレス : aaa@aaa
    パスワード : aaa111
  患者家族
    メールアドレス : a@a
    パスワード : aaa111

# 利用方法
### スタッフアカウント
  * 入院患者のデータベース操作  
  入院（登録）、退院（削除）、転棟・転室（詳細・編集）、一覧表示
### 家族アカウント
  * 面会予約、一覧表示、詳細表示、変更、削除

# アプリケーション作製の背景
  当院では、面会を完全予約制としていた時期があり、その予約方法は  
  患者家族が病院へ電話する　→ 事務が受け、病棟へ繋ぐ　→ 看護師が確認が面会可能か確認する　→ 承諾する  
  といった流れであった。しばしば事務・看護業務が滞ることがあり、ネットで予約できる機能があると良いのではと考えた。

# 要件シート
  https://docs.google.com/spreadsheets/d/1jGwedmSThwS4Qy18OXHkuSJDIkHuTig8F3z3t-nIO1A/edit?gid=982722306#gid=982722306

# データベース設計
## ER図
  https://i.gyazo.com/fbf375d6919b05a9bdb3de2e6a1dc6e3.png

## テーブル
### staff_members
| Column               | Type     | Options                   |
|----------------------|----------|---------------------------|
| staff_number         | integer  | null: false, unique: true |
| staff_last_name      | string   | null: false               |
| staff_first_name     | string   | null: false               |
| staff_department_id  | integer  | null: false               |
| staff_affiliation_id | integer  | null: false               |
| email                | string   | null: false, unique: true |
| password             | string   | null: false               |
### Association
- has_many :patients

### patients
| Column                  | Type    | Options                   |
|-------------------------|---------|---------------------------|
| patient_number          | integer | null: false, unique: true |
| patient_last_name       | string  | null: false               |
| patient_first_name      | string  | null: false               |
| patient_last_name_kana  | string  | null: false               |
| patient_first_name_kana | string  | null: false               |
| birthday                | date    | null: false               |
| floor                   | integer |                           |
| room                    | integer |                           |
### Association
- belongs_to :staff_member
- has_many :families, through: :promises

### families
| Column                 | Type   | Options                   |
|------------------------|--------|---------------------------|
| family_last_name       | string | null: false               |
| family_first_name      | string | null: false               |
| family_last_name_kana  | string | null: false               |
| family_first_name_kana | string | null: false               |
| email                  | string | null: false, unique: true |
| password               | string | null: false               |
### Association
- has_many :patients
- has_many :patients, through: :promises

### promises
| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| family_id       | references | null: false, foreign_key: true |
| patient_id      | references | null: false, foreign_key: true |
| day             | date       | null: false                    |
| meeting_time_id | integer    | null: false                    |
#### Association
- belongs_to :family
- belongs_to :patient

# 画面遷移図
  https://i.gyazo.com/cf895fd5fb7a979e0d2c52c79b73d876.png

# 実装予定の機能
  結合テスト

# 開発環境
- Ruby on Rails