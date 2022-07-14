# テーブル設計
## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_katakana| string  | null: false |
| year_id            | integer | null: false |
| month_id           | integer | null: false |
| day_id             | integer | null: false |


### Association
- has_many :items
- has_many :comments
- has_many :orders
- has_many :delivery_addresses


- belong_to :year
- belong_to :month
- belong_to :day


## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| detail             | text      | null: false                    |
| price              | string    | null: false                    |
| user               | reference | null: false, foreign_key: true |
| category_id        | integer   | null: false                    |
| condition_id       | integer   | null: false                    |
| delivery_id        | integer   | null: false                    |
| prefecture_id      | integer   | null: false                    |
| delivery_day_id    | integer   | null: false                    |


### Association
- has_one :order
- has_many :comments
- belong_to :user

- belong_to :category
- belong_to :condition
- belong_to :delivery
- belong_to :prefecture
- belong_to :delivery_day


## order テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user               | reference | null: false, foreign_key: true |          
| item               | reference | null: false, foreign_key: true |         
 


### Association
- belong_to :user
- belong_to :items
- has_one :delivery_addresses


## delivery_addresses テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| post_code          | string    | null: false                    |
| city               | string    | null: false                    |
| address            | string    | null: false                    |
| phone_number       | string    | null: false                    |
| user               | reference | null: false, foreign_key: true |            
| order              | reference | null: false, foreign_key: true |         
| prefecture_id      | integer   | null: false                    |


### Association
- belong_to :user
- belong_to :order

- belong_to :prefecture





# ActiveHash::Baseを用いるモデル
##　year model


### Association
- has_many :users


##　month モデル

### Association
- has_many :users

##　day モデル

### Association
- has_many :users

##　category モデル(カテゴリー)


### Association
- has_many :items

##　condition モデル(商品の状態)


### Association
- has_many :items

##　delivery_charge モデル(配送の負担)


### Association
- has_many :items

##　prefecture モデル(県)

### Association
- has_many :items
- has_many :delivery_addresses


##　delivery_day モデル(配送までの日数)
|

### Association
- has_many :items


