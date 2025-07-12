FactoryBot.define do
  factory :family do
    family_last_name         {Faker::Name.last_name}
    family_first_name        {Faker::Name.first_name}
    family_last_name_kana    {"テック"}
    family_first_name_kana   {"テクテク"}
    email                    {Faker::Internet.email}
    password                 {Faker::Internet.password(min_length: 6)}
    password_confirmation    {password}
  end
end
