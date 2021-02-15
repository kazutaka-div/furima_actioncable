# DB設計

## usersテーブル

|Column            |Type   |Options    |
|------------------|-------|-----------|
|nickname          |string |null: false|
|email             |string |null: false|
|encrypted_password|string |null: false|
|first_name        |string |null: false|
|last_name         |string |null: false|
|first_name_kana   |string |null: false|
|last_name_kana    |string |null: false|
|birth_date        |date   |null: false|

### Association
- has_many :items
- has_many :item_transactions


## itemsテーブル

|Column                             |Type   |Options          |
|-----------------------------------|-------|-----------------|
|name                               |string |null: false      |
|info                               |text   |null: false      |
|price                              |integer|null: false      |
|scheduled_delivery_id(acitve_hash) |integer|null: false      |
|shipping_fee_status_id(acitve_hash)|integer|null: false      |
|prefecture_id(acitve_hash)         |integer|null: false      |
|sales_status_id(acitve_hash)       |integer|null: false      |
|category_id(acitve_hash)           |integer|null: false      |
|user_id                            |integer|foreign_key: true|

### Association
- belongs_to :user
- has_one    :item_transactions


## addressesテーブル

|Column                    |Type   |Options          |
|--------------------------|-------|-----------------|
|postal_code               |string |null: false      |
|prefecture_id(acitve_hash)|integer|null: false      |
|city                      |string |null: false      |
|address                   |string |null: false      |
|building                  |string |                 |
|phone_number              |string |null: false      |
|item_transaction_id       |integer|foreign_key: true|

### Association
- belongs_to :item_transactions


## item_transactionsテーブル

|Column |Type   |Options          |
|-------|-------|-----------------|
|item_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one    :address