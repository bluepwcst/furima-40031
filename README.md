# README

# データベース設計

## テーブル構造

### Usersテーブル
| Column                 | Type    | Options                  |
|--------------          |---------|--------------------------|
| user_id                | integer | primary key, not null    |
| username               | string  | not null                 |
| email                  | string  | not null, unique         |
| encrypted-password     | string  | not null                 |
| birthdate              | date    |                          |

### Ordersテーブル
| Column       | Type     | Options                  |
|--------------|----------|--------------------------|
| order_id     | integer  | primary key, not null    |
| user_id      | integer  | foreign key, not null    |
| product_id   | integer  | foreign key, not null    |
| address_id   | integer  | foreign key, not null    |
| payment_id   | integer  | foreign key, not null    |
| total_price  | decimal  | not null                 |
| status       | string   |                          |
| created_at   | datetime | not null                 |
| updated_at   | datetime | not null                 |

### Paymentsテーブル
| Column         | Type     | Options               |
|----------------|----------|-----------------------|
| payment_id     | integer  | primary key, not null |
| order_id       | integer  | foreign key, not null |
| payment_method | string   | not null              |
| payment_status | string   | not null              |
| payment_date   | datetime | not null              |

### Addressesテーブル
| Column         | Type    | Options                  |
|----------------|---------|--------------------------|
| address_id     | integer | primary key, not null    |
| user_id        | integer | foreign key, not null    |
| postal_code    | string  | not null                 |
| prefecture     | string  | not null                 |
| city           | string  | not null                 |
| street_address | string  | not null                 |
| building_name  | string  |                          |
| phone_number   | string  | not null                 |

### Productsテーブル
| Column        | Type     | Options                  |
|---------------|----------|--------------------------|
| product_id    | integer  | primary key, not null    |
| user_id       | integer  | foreign key, not null    |
| name          | string   | not null                 |
| image_url     | string   |                          |
| description   | text     | not null                 |
| category_id   | integer  | foreign key, not null    |
| condition_id  | integer  | foreign key, not null    |
| price         | decimal  | not null                 |
| created_at    | datetime | not null                 |
| updated_at    | datetime | not null                 |

### Categoriesテーブル
| Column      | Type    | Options               |
|-------------|---------|-----------------------|
| category_id | integer | primary key, not null |
| name        | string  | not null              |

### ProductConditionsテーブル
| Column       | Type    | Options               |
|--------------|---------|-----------------------|
| condition_id | integer | primary key, not null |
| name         | string  | not null              |

## アソシエーション

### Users
- has_many :products
- has_many :orders
- has_many :addresses

### Products
- belongs_to :user
- belongs_to :category
- belongs_to :product_condition
- has_one :order

### Orders
- belongs_to :user
- belongs_to :product
- has_one :payment
- has_one :address

### Payments
- belongs_to :order

### Addresses
- belongs_to :user
- has_one :order

### Categories
- has_many :products

### ProductConditions
- has_many :products
