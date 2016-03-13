FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "email+#{i}@example.com" }
    password 'password123'
  end
end
