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
| birth_y          | integer | null: false |
| birth_m          | integer | null: false |
| birth_d          | integer | null: false |

### Association
has_many items
has_one address
has_many record

## items テーブル
| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| image          | ActiveStorageで実践             |
| user           | references | foreign_key: true |
| address        | references | foreign_key: true |
| title          | string     | null: false       |
| describe       | string     | null: false       |
| category       | string     | null: false       |
| status         | string     | null: false       |
| shipping_cost  | string     | null: false       |
| shipping_area  | string     | null: false       |
| shipping_days  | string     | null: false       |
| price          | integer    | null: false       |

### Association
belongs_to user
belongs_to record
has_one address
has_one_attached image

## records テーブル
| Column      | Type       | Options            |
| ----------- | ---------- | ------------------ |
| buy_day     | integer    | null: false        |
| user        | references | foreign_key: true  |
| item        | references | foreign_key: true  |

### Association
belongs_to user
has_one items

## addresses テーブル
| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| postal_cord     | integer    | null: false       |
| prefecture      | string     | null: false       |
| city            | string     | null: false       |
| house_number    | string     | null: false       |
| building_number | string     |                   |
| phone_number    | integer    | null: false       |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true |

### Association
belongs_to user
belongs_to item