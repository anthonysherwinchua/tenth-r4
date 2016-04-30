FactoryGirl.define do
  factory :applicant_family_members do
    association :applicant, factory: :applicant, strategy: :build
    association :relationship, factory: :relationship, strategy: :build

    sequence(:occupation) {|i| "Occupation #{i}" }
    sequence(:name) {|i| "Name #{i}" }
    age '20'

    trait :invalid do
      name nil
    end
  end
end
