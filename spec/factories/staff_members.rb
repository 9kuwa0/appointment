FactoryBot.define do
  factory :staff_member do
    staff_number            {rand(1000..9999)}
    staff_last_name         {Faker::Name.last_name}
    staff_first_name        {Faker::Name.first_name}
    staff_department_id     {rand(2..11)}
    staff_affiliation_id    {rand(2..18)}
    email                   {Faker::Internet.email}
    password                {Faker::Internet.password(min_length: 6)}
    password_confirmation   {password}
  end
end
