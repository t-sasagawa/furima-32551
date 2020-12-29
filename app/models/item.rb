class Item < ApplicationRecord

  validates :image, presence: true

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9999999, only_integer: true }
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :state_id
    validates :fee_id
    validates :prefecture_id
    validates :days_ship_id
  end

  has_one_attached :image
  belongs_to :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :days_ship
  # belongs_to_active_hashメソッドを使用する、とカリキュラムにあるが調べても理由が出てこない。つまりどんなメソッドなのか。

end
