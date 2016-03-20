FactoryGirl.define do
  factory :skin_type do
    sequence(:name) { |i| "Skin Type ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
