FactoryGirl.define do
  factory :collaborator do
    user nil
    wiki nil
    email { Faker::Internet.email }
  end
end
