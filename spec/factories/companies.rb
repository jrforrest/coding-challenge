FactoryGirl.define do
  factory(:company) do
    name { Faker::Company.name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    description { Faker::Lorem.paragraphs.join("\n") }
  end
end
