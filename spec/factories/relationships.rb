FactoryGirl.define do
  factory :relationship do
    sequence(:name) { |i| "Relationship ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
