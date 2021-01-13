class Item < ApplicationRecord

  validates :image, presence: true

  with_options presence: true do
    validates :title, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, numericality: { only_integer: true, message: 'Half-width number'}
    validates_inclusion_of :price, in: 300..9999999, message: 'Out of setting range'
  end

  with_options numericality: { other_than: 0 , message: 'Select'} do
    validates :category_id
    validates :state_id
    validates :fee_id
    validates :prefecture_id
    validates :days_ship_id
  end

  has_one_attached :image
  belongs_to :user
  has_one :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :days_ship
  
end
