FactoryGirl.define do
  factory :academic_degree do
    sequence(:name) { |i| "Bachelor in #{i}"}

    trait :invalid do
      name nil
    end
  end
end
