FactoryGirl.define do
  factory :blood_type do
    sequence(:name) { |i| "Blood Type ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
