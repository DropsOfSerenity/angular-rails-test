FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "foobarfoobar"
    username "Example Username"
  end

  factory :post do
    text "Some Long Body Text"
    title "Title of the post."

    trait :now do
      created_at Time.now
    end

    trait :last_week do
      created_at 1.week.ago
    end
  end
end
