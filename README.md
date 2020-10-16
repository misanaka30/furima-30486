# README

## users テーブル
| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kana   | string  | null: false |
| birthday         | date    | null: false |


### Association
has_many items
has_many records

## items テーブル
| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| user             | references | foreign_key: true |
| title            | string     | null: false       |
| describe         | text       | null: false       |
| category_id      | integer    | null: false       |
| status_id        | integer    | null: false       |
| shipping_cost_id | integer    | null: false       |
| shipping_area_id | integer    | null: false       |
| shipping_days_id | integer    | null: false       |
| price            | integer    | null: false       |

### Association
belongs_to user
has_one record
has_one_attached image
belongs_to_active_hash shipping_cost_id
belongs_to_active_hash shipping_area_id
belongs_to_active_hash shipping_days_id
belongs_to_active_hash status_id 
belongs_to_active_hash category_id



## records テーブル
| Column      | Type       | Options            |
| ----------- | ---------- | ------------------ |
| user        | references | foreign_key: true  |
| item        | references | foreign_key: true  |

### Association
belongs_to user
belongs_to item
has_one address

## addresses テーブル
| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_cord_id  | string     | null: false       |
| prefecture_id   | integer    | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_number | string     |                   |
| phone_number    | string     | null: false       |
| record          | references | foreign_key: true |

### Association
belongs_to_active_hash :prefecture
belongs_to record
belongs_to_active_hash postal_cord_id
belongs_to_active_hash prefecture_id