FactoryGirl.define do
  factory :applicant do
    association :religion, factory: :religion, strategy: :build
    association :civil_status, factory: :civil_status, strategy: :build

    sequence(:first_name) { |i| "First ##{i}" }
    sequence(:last_name) { |i| "Last ##{i}" }
    birthday { [*18..55].sample.year.ago }
    gender '1'

    trait :invalid do
      first_name nil
    end
  end
end
