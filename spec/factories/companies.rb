FactoryGirl.define do
  factory(:company) do
    name { Faker::Company.name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    description { Faker::Lorem.paragraphs.join("\n") }
    founded_at { rand(1..8).weeks.ago }

    trait :with_founders do
      after(:build) do |company|
        rand(1..3).times { company.founders << build(:founder, company: company) }
      end
    end
  end
end
