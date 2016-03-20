FactoryGirl.define do
  factory :academic_level do
    sequence(:name) { |i| "Level ##{i}"}

    trait :invalid do
      name nil
    end
  end
end
