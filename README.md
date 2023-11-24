# README

# データベース設計

## テーブル構造

### Usersテーブル
| Column              | Type    | Options                      |
|---------------------|---------|------------------------------|
| username            | string  | null: false                  |
| email               | string  | null: false, unique: true    |
| encrypted_password  | string  | null: false                  |
| birth_date           | date    | null: false                                               |

### Ordersテーブル
| Column     | Type    | Options                      |
|------------|---------|------------------------------|
| user_id    | integer | foreign key, null: false     |
| product_id | integer | foreign key, null: false     |


### Addressesテーブル
| Column         | Type    | Options                      |
|----------------|---------|------------------------------|
| order_id       | integer | foreign key, null: false     |
| postal_code    | string  | null: false                  |
| prefecture     | string  | null: false                  |
| city           | string  | null: false                  |
| street_address | string  | null: false                  |
| building_name  | string  |                              |
| phone_number   | string  | null: false                  |


### Productsテーブル
| Column        | Type     | Options                      |
|---------------|----------|------------------------------|
| user_id       | integer  | foreign key, null: false     |
| name          | string   | null: false                  |
| image_url     | string   |                              |
| description   | text     | null: false                  |
| category_id   | integer  | foreign key, null: false     |
| condition_id  | integer  | foreign key, null: false     |
| price         | decimal  | null: false                  |
| created_at    | datetime | null: false                  |
| updated_at    | datetime | null: false                  |



## アソシエーション

### Users
- has_many :products
- has_many :orders

### Products
- belongs_to :user
- has_one :order

### Orders
- belongs_to :user
- belongs_to :product
- has_one :address

### Addresses
- belongs_to :order

