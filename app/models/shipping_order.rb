class ShippingOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code,          format:{ with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }            #郵便番号
    validates :municipality,         format:{ with: /\A[ぁ-んァ-ン一-龥]/,   message: "is invalid. Input full-width characters." } #市区町村
    validates :address,              format:{ with: /\A[ぁ-んァ-ン一-龥]/,   message: "is invalid. Input full-width characters." } #番地
    validates :phone_number,   numericality:{ only_integer: true,            message: "is invalid. Input half-width characters." } #電話番号
  end
  validates :building, format:{ with: /\A[ぁ-んァ-ン一-龥]/,   message: "is invalid. Input full-width characters." } #建物名
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" } #都道府県
    

  def save
    # 各テーブルにデータを保存する処理を書く
    oreder = Order.create(item_id: item.id, user_id: user.id)
    Shipping.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end


end