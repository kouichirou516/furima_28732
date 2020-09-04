# テーブル設計

## users テーブル

| Colum           | Type    | Options     |
| --------------  | ------  | null: false |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Colum           | Type    | Options     |
| --------------  | ------- | null: false |
| image           | string  | null: false |
| name            | string  | null: false |
| description     | string  | null: false |
| category        | integer | null: false |
| status          | integer | null: false |
| price           | integer | null: false |
| sale_charge     | integer | null: false |
| shipping_charge | integer | null: false |
| area            | integer [ null: false |
| shipping_time   | integer | null: false |
| user_id         | integer | null: false , foreign_key: true |
### Association

- has_one :purchase
- belongs_to :user

## purchase テーブル

| Colum           | Type    | Options     |
| --------------  | ------- | null: false |
| user_id         | integer | null: false , foreign_key: true |
| item_id         | integer | null: false , foreign_key: true |

### Association

- has_one :shipping_address
- belongs_to :user
- belongs_to :item

## shipping_address テーブル

| Colum           | Type    | Options     |
| --------------  | ------- | null: false |
| purchase        | references | null: false , foreign_key: true |
| Prefectures     | string  | null: false |
| postal_cord     | string  | null: false |
| city            | string  | null: false |
| address         | integer | null: false |
| building        | string  | ----------- |
| phone_number    | integer | null: false |

### Association

- belongs_to :purchase

