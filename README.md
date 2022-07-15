# テーブル設計
## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique:true  |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_katakana| string  | null: false               |
| last_name_katakana | string  | null: false               |
| birth_date         | date    | null: false               |



### Association
- has_many :items
- has_many :orders





## items テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | string    | null: false                    |
| detail             | text      | null: false                    |
| price              | integer   | null: false                    |
| user               | references| null: false, foreign_key: true |
| category_id        | integer   | null: false                    |
| condition_id       | integer   | null: false                    |
| delivery_id        | integer   | null: false                    |
| prefecture_id      | integer   | null: false                    |
| delivery_day_id    | integer   | null: false                    |


### Association
- has_one :order
- belongs_to :user

- belongs_to :category
- belongs_to :condition
- belongs_to :delivery
- belongs_to :prefecture
- belongs_to :delivery_day


## orders テーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| user               | references| null: false, foreign_key: true |          
| item               | references | null: false, foreign_key: true |         

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery_address



## delivery_addresses テーブル
| post_code          | integer   | null: false                    |
| city               | string    | null: false                    |
| address            | string    | null: false                    |
| building_name      | string    |                                |
| phone_number       | string    | null: false                    | 
| prefecture_id      | integer   | null: false                    |

### Association
- belongs_to :order

- belongs_to :prefecture




# ActiveHash::Baseを用いるモデル


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
- has_many :orders


##　delivery_day モデル(配送までの日数)
|

### Association
- has_many :items


