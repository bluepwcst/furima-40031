# データベース設計

## テーブル構造

### Usersテーブル
| Column              | Type    | Options                       |
|---------------------|---------|-------------------------------|
| username            | string  | null: false                   |
| email               | string  | null: false, unique: true     |
| encrypted_password  | string  | null: false                   |
| birth_date          | date    | null: false                   |
| last_name           | string  | null: false                   |
| first_name          | string  | null: false                   |
| last_name_kana      | string  | null: false                   |
| first_name_kana     | string  | null: false                   |

### Users
- has_many :products
- has_many :orders

### Ordersテーブル
| Column    | Type       | Options                         |
|-----------|------------|---------------------------------|
| user      | references | null: false, foreign_key: true  |
| product   | references | null: false, foreign_key: true  |

### Orders
- belongs_to :user
- belongs_to :product
- has_one :address

### Addressesテーブル
| Column         | Type       | Options                      |
|----------------|------------|------------------------------|
| order          | references | null: false, foreign_key: true|
| postal_code    | string     | null: false                  |
| region_id      | integer    | null: false                  |  <!-- ActiveHashのカラム名と一致 -->
| city           | string     | null: false                  |
| street_address | string     | null: false                  |
| building_name  | string     |                              |
| phone_number   | string     | null: false                  |

### Addresses
- belongs_to :order

### Itemsテーブル
| Column            | Type       | Options                      |
|-------------------|------------|------------------------------|
| user              | references | null: false, foreign_key: true|
| name              | string     | null: false                  |
| description       | text       | null: false                  |
| category_id       | integer    | null: false                  |
| condition_id      | integer    | null: false                  |
| shipping_charge_id| integer    | null: false                  |
| region_id         | integer    | null: false                  |
| delivery_time_id  | integer    | null: false                  |
| price             | integer    | null: false                  |

### items
- belongs_to :user
- has_one :order
