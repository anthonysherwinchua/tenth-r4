FactoryGirl.define do
  factory :occupation do
    sequence(:name) { |i| "Occupation ##{i}" }

    trait :invalid do
      name nil
    end
  end
end
