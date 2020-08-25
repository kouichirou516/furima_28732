# テーブル設計

## users テーブル

| Colum           | Type    | Options     |
| --------------  | ------  | null: false |
| nickname        | string  | null: false |
| mail address    | string  | null: false |
| password        | string  | null: false |
| last name       | string  | null: false |
| first name      | string  | null: false |
| last name kana  | string  | null: false |
| first name kana | string  | null: false |
| birth year      | integer | null: false |
| birth month     | integer | null: false |
| birth date      | integer | null: false | 

### Association

- has_many :items
- has_many :orders

## items テーブル

| Colum           | Type    | Options     |
| --------------  | ------- | null: false |
| image           | string  | null: false |
| name            | string  | null: false |
| description     | string  | null: false |
| category        | string  | null: false |
| status          | string  | null: false |
| price           | integer | null: false |
| sale_charge     | string  | null: false |
| shipping_charge | string  | null: false |
| shipping_time   | string  | null: false |
| area            | string  | null: false |
| seller_id       | string  | null: false |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Colum           | Type    | Options     |
| --------------  | ------- | null: false |
| item_id         | string  | null: false |
| buyer_id        | string  | null: false |
| credit card     | string  | null: false |
| postal cord     | integer | null: false |
| prefectures     | string  | null: false |
| city            | string  | null: false |
| address         | integer | null: false |
| building        | string  | null: false |
| phone number    | integer | null: false |

### Association

- belongs_to :users
- belongs_to :items

