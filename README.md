
 # テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column           | Type                | Options                   |
|------------------|---------------------|---------------------------|
| image            | ActiveStorageで実装 |                           |
| title            | string              | null: false               |
| text             | text                | null: false               |
| category_id      | integer             | foreign_key: true         |
| state_id         | integer             | foreign_key: true         |
| fee_id           | integer             | foreign_key: true         |
| ship_source_id   | integer             | foreign_key: true         |
| days_ship_id     | integer             | foreign_key: true         |
| price            | integer             | null: false               |
| user             | reference           | foreign_key: true         |

### Association
- belongs_to :user
- has_one :order

## shippingsテーブル
| Column          | Type      | Options                   |
|-----------------|-----------|---------------------------|
| postal_code     | string    | null: false               |
| prefectures_id  | integer   | foreign_key: true         |
| municipality    | string    | null: false               |
| address         | string    | null: false               |
| building        | string    | null: false               |
| phone_number    | string    | null: false, unique: true |
| user            | reference | foreign_key: true         |

### Association
- belongs_to :user
- belongs_to :shipping

## ordersテーブル
| Column | Type      | Options           |
|--------|-----------|-------------------|
| user   | reference | foreign_key: true |
| item   | reference | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping