# テーブル設計

## users テーブル

| Colum           | Type    | Options     |
| --------------  | ------  | null: false |
| nickname        | string  | null: false |
| mail_address    | string  | null: false |
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
| price           | integer | null: false |
| user_id         | string  | null: false |

### Association

- has_one :purchase
- belongs_to :user

## purchase テーブル

| Colum           | Type    | Options     |
| --------------  | ------- | null: false |
| user_id         | string  | null: false |
| item_id         | string  | null: false |

### Association

- has_one :shipping_address
- belongs_to :user
- belongs_to :item

## shipping_address テーブル

| Colum           | Type    | Options     |
| --------------  | ------- | null: false |
| postal_cord     | string  | null: false |
| city            | string  | null: false |
| address         | integer | null: false |
| building        | string  | ----------- |
| phone_number    | integer | null: false |

### Association

- belongs_to :purchase

