FactoryGirl.define do
  factory :civil_status do
    sequence(:name) { |i| "Civil Status ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
