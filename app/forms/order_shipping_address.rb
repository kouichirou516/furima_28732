class OrderShippingAddress

  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :token, :prefectures_id, :postal_code, :city, :address, :building, :phone_number

  #orders model
  validates :user_id, :item_id, :token, presence: true

  #shipping_address
  validates :prefectures_id, :city, :address, presence: true

  validates :prefectures_id, numericality: { other_than: 1 }  

  validates :phone_number, format: { with: /\A[0-9]+\z/ }  #半角数字
  validates :phone_number, presence: true, format: { with: /\A^\d{11}$\z/ }  #ハイフンなし11桁以内
  validates :postal_code, presence: true, format: { with: /\A^\d{3}[-]\d{4}\z/ }  #ハイフンあり7桁
  def save
  
    order = Order.create(item_id: item_id, user_id: user_id)

    ShippingAddress.create(order_id: order.id, prefectures_id: prefectures_id, postal_code: postal_code, city: city, address: address, building: building, phone_number: phone_number)
    end
end