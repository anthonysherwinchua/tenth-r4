FactoryGirl.define do
  factory :applicant_family_details do
    association :applicant, factory: :applicant, strategy: :build

    sisters 2
    brothers 1
    no_in_fam 3
    eldest 10
    youngest 5
    children 3
    
    trait :invalid do
      first_name nil
    end
  end
end
