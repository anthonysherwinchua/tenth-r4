FactoryGirl.define do
  factory :document do
    sequence(:name) { |i| "Document ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
