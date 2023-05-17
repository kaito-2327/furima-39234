class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|

      t.string     :post_code,       null: false
      t.integer    :prefecture_id,   null: false
      t.string       :municipality,    null: false
      t.string    :address,         null: false
      t.string    :bldg
      t.string    :phone,           null: false
      t.references :buy,             null: false, foreign_key: true
      t.timestamps
    end
  end
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