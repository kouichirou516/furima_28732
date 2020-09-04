FactoryBot.define do
  factory :item do

    name                 {"hoge"}
    description          {"hogehogehoge"}
    category_id          {2}
    status_id            {2}
    shipping_charge_id   {2}
    area_id              {13}
    shipping_time_id     {2}
    price                {"9999"}
    user_id              {1}

    # アソシエーション
    association :user

    # 1枚の画像をアップロードする
    trait :image do
      after(:build) do |item|
        File.open("#{Rails.root}/public/images/test_image.png") do |f|
          item.images.attach(io: f, filename: "public/images/test_image.png", content_type: 'image/jpeg')
        end
      end
    end
    
  end
end
