class BuyDelivery
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :address, :bldg, :phone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A[0-9]{10-11}\z/, message: 'is invalid' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1 } 

  def save
    # 購入情報を保存し、変数buyに代入する
    buy = Buy.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, address: address, bldg: bldg, phone: phone, buy_id: buy.id )
  end
end