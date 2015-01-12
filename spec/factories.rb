FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password "validpassword"
    password_confirmation "validpassword"
    username { Faker::Internet.user_name }
  end

  factory :post do
    text { Faker::Lorem.paragraph }
    title { Faker::Lorem.word }

    trait :now do
      created_at Time.now
    end

    trait :last_week do
      created_at 1.week.ago
    end
  end
end
