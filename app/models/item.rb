class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to :user
  has_one :record
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_area
  belongs_to_active_hash :shipping_days

  with_options presence: true do
    validates :image
    validates :category
    validates :title
    validates :describe
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_area_id
    validates :shipping_days_id
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_area_id
    validates :shipping_days_id
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters.' } do
    validates :price
  end
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
