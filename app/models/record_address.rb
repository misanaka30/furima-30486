class RecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  with_options presence: true, length: { maximum: 11}, format: {with: /\A[0-9]{11}/, message: "input only number" } do
    validates :phone_number
  end

  with_options presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" } do
    validates :postal_code
  end


  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, record_id: record.id)
  end


end