# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| user_id            | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |

### Association

- has_many :tasks 
- has_many :rooms
- has_many :comments
- has_many :mytasks

## rooms テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :user

## tasks テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| taskname           | string       | null: false                    |
| frequency_id       | integer      | null: false                    |
| when               | date         | null: false                    |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_one    :mytask

## comments テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| content            | text         | null: false                    |
| task               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :task

## mytasks テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| task               | references   | null: false, foreign_key: true |
| user               | references   | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :task


