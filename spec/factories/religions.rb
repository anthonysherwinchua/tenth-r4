FactoryGirl.define do
  factory :religion do
    sequence(:name) { |i| "Religion ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
