FactoryGirl.define do
  factory :job_opening do
    country
    occupation

    trait :invalid do
      occupation_id nil
    end
  end
end
