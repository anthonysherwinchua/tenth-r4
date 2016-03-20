FactoryGirl.define do
  factory :country do
    sequence(:name) { |i| "Country ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
