class OrderShippingAddress

  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :token, :prefectures_id, :postal_code, :city, :address, :building, :phone_number

  #orders model
  validates :user_id, :item_id, :token, presence: true

  #shipping_address
  validates :prefectures_id, :postal_code, :city, :address, :phone_number, presence: true

  def save
  
    order = Order.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(order_id: order.id, prefectures_id: prefectures_id, postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number)
    end
end