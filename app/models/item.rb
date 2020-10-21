class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  with_options presence: true do
   validates :image
   validates :category
   validates :status
   validates :shipping_cost
   validates :shipping_area
   validates :shipping_days
  end
  
  with_options numericality: { other_than: 1 } do
   validates :category_id
   validates :status_id
   validates :shipping_cost_id
   validates :shipping_area_id
   validates :shipping_days_id
  end

  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_qual_to: 9999999}
end
