# README

## users テーブル

| Column              | Type    | Options     |
| --------------------| ------  | ----------  |
| email               | string  | null: false |
| password            | string  | null: false |
| nickname            | string  | null: false |
| self_introduction   | text    | null: false |
| country_id          | integer | null: false |
| gender_id           | integer |             |
| age                 | integer |             |

### Association
##has_many :sends
##has_many :comments
##has_many :room_users
##has_many :rooms, through: room_users
##has_many :messages
##has_one_attached :image

## sends テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | -----------------------------  |
| content    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association
has_one_attached :image
belongs_to :user
has_many :comments
has_many :send_tag_relations
has_many :tags, through: :send_tag_relations

## comments テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | -----------------------------  |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| send       | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :send
has_many_attached :images

## send_tag_relations テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | -----------------------------  |
| send       | references | null: false, foreign_key: true |
| tag        | references | null: false, foreign_key: true |

### Association
belongs_to :send
belongs_to :tag

## tags テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | -----------------------------  |
| send       | references | null: false, foreign_key: true |
| tag        | references | null: false, foreign_key: true |

### Association
has_many :send_tag_relations
has_many :tags, through :send_tag_relations

## room_users テーブル
| Column   | Type       | Options                        |
| ---------| ---------- | -----------------------------  |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :room

## rooms テーブル　
| Column     | Type       | Options                        |
| ---------- | ---------- | -----------------------------  |
| user       | references | null: false, foreign_key: true |

### Association
has_many :room_users
has_many :users, through :room_users
has_many :messages

## messages テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | -----------------------------  |
| content    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| room       | references | null: false, foreign_key: true |
 
 ### Association
 belongs_to :user
 belongs_to :room
 has_many_attached :images
