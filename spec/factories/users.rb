FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "email+#{i}@example.com" }
    sequence(:username) { |i| "username+#{i}" }
    sequence(:name) { |i| "name+#{i}" }
    password 'password123'

    after :create do |user|
      user.add_role :admin
    end

    trait :encoder do
      after :create do |user|
        user.roles = [] # removes :admin role
        user.add_role :encoder
      end
    end

    trait :invalid do
      email nil
    end
  end
end
