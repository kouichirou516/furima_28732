FactoryBot.define do
  factory :user do
    password              {Faker::Internet.password(min_length: 6)}
    nickname              {Faker::Name.initials(number: 3)}
    first_name            { "全かク" }
    last_name             { "全かク" }
    first_name_kana       { "カタカナ" }
    last_name_kana        { "カタカナ" }
    birthday              { "2020-01-01" }
    email                 {Faker::Internet.free_email}
    password              {password}
    password_confirmation {password}
  end
end