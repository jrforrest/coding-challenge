FactoryGirl.define do
  factory(:founder) do
    company
    full_name { Faker::Name.name }
    position { Faker::Company.profession }
  end
end
