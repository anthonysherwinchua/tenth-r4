FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "email+#{i}@example.com" }
    password 'password123'

    trait :invalid do
      email nil
    end
  end
end
