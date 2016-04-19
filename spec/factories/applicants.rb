FactoryGirl.define do
  factory :applicant do
    sequence(:first_name) { |i| "Document ##{i}" }
    sequence(:last_name) { |i| "Document ##{i}" }
    birthday { [*18..55].sample.year.ago }
    gender 'female'

    religion
    civil_status

    trait :invalid do
      first_name nil
    end
  end
end
