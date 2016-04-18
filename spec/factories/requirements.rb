FactoryGirl.define do
  factory :requirement do
    enabled true
    job_opening
    document

    trait :invalid do
      job_opening nil
    end
  end
end
