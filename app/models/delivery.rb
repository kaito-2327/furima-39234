class Delivery < ApplicationRecord
  belongs_to :buy

  # validates :post_code,        presence: true
  # validates :prefecture_id,    presence: true
  # validates :municipality,     presence: true
  # validates :address,          presence: true
  # validates :bldg,   
  # validates :phone,            presence: true
end
# | Column         | Type       | Options                        |
# | -------------- | ---------- | ------------------------------ |
# | post_code      | string     | null: false                    | 郵便番号
# | prefecture_id  | integer    | null: false                    | 地域
# | municipality   | string     | null: false                    | 市町村
# | address        | string     | null: false                    | 番地
# | bldg           | string     |                                | 建物
# | phone          | string     | null: false                    | 電話
# | buy            | references | null: false, foreign_key: true | 購入履歴
  
# belongs_to　:delivery 