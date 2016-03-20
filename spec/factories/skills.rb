FactoryGirl.define do
  factory :skill do
    sequence(:name) { |i| "Skill ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
