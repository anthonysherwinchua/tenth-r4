FactoryGirl.define do
  factory :academic_degree do
    academic_level
    sequence(:name) { |i| "Bachelor in #{i}" }

    trait :invalid do
      name nil
    end
  end
end
