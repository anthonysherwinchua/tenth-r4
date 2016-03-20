FactoryGirl.define do
  factory :language do
    sequence(:name) { |i| "Language ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
