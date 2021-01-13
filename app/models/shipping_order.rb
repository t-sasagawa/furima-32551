class ShippingOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code,          format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }            #郵便番号
    validates :municipality #市区町村
    validates :address #番地
    validates :phone_number,   numericality:{ only_integer: true,            message: "is invalid. Input half-width characters." } #電話番号
      validates :phone_number, length: { in:1..11, message: "Must be 11 characters or less" }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "Select" } #都道府県
    

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end


end