
 # テーブル設計

## usersテーブル
| Column          | Type   | Options                   |
|-----------------|--------|---------------------------|
| nickname        | string | null: false, unique: true |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| last-name       | string | null: false               |
| first-name      | string | null: false               |
| last-name-kana  | string | null: false               |
| first-name-kana | string | null: false               |
| birthday        | string | null: false               |

### Association
- has_many :items
- has_many :shippings
- has_many :orders

## itemsテーブル
| Column           | Type                | Options                   |
|------------------|---------------------|---------------------------|
| image            | ActiveStorageで実装 |                           |
| title            | string              | null: false               |
| text             | text                | null: false               |
| category         | reference           | foreign_key: true         |
| state            | reference           | foreign_key: true         |
| fee              | reference           | foreign_key: true         |
| ship-source      | reference           | foreign_key: true         |
| days-ship        | reference           | foreign_key: true         |
| price            | string              | null: false               |
| sales-commission | reference           | foreign_key: true         |
| sales-profit     | reference           | foreign_key: true         |
| user_id          | reference           | foreign_key: true         |

### Association
- belongs_to :user
- has_one :order

## shippingsテーブル
| Column       | Type      | Options                   |
|--------------|-----------|---------------------------|
| postal-code  | string    | null: false               |
| prefectures  | reference | foreign_key: true         |
| municipality | string    | null: false               |
| address      | string    | null: false               |
| building     | string    | null: false               |
| phone-number | string    | null: false, unique: true |
| user_id      | reference | foreign_key: true         |

### Association
- belongs_to :user
- has_one :shipping

## ordersテーブル
| Column      | Type      | Options           |
|-------------|-----------|-------------------|
| user_id     | reference | foreign_key: true |
| item_id     | reference | foreign_key: true |
| shipping_id | reference | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping