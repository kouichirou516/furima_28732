FactoryBot.define do
  factory :order_shipping_address do

    token          { '4242424242424242' }
    postal_code    { '111-1111' }
    prefectures_id { '2' }
    city           { '港区' }
    address        { '1-1-1' }
    building       { 'マンション' }
    phone_number   { '09012345678' }
    association :user
    association :item
  end
end