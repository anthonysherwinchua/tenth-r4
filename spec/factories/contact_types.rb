FactoryGirl.define do
  factory :contact_type do
    sequence(:name) { |i| "Contact Type ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
