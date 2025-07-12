FactoryBot.define do
  factory :patient do
    patient_number            {rand(100000..999999)}
    patient_last_name         {Faker::Name.last_name}
    patient_first_name        {Faker::Name.first_name}
    patient_last_name_kana    {"テック"}
    patient_first_name_kana   {"テクテク"}
    floor                     {rand(3..5)}
    room                      {rand(300..599)}
    birthday                  { Faker::Date.birthday(min_age: 0, max_age: 120) }
  end
end
