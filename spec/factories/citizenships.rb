FactoryGirl.define do
  factory :citizenship do
    sequence(:name) { |i| "Citizenship ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
