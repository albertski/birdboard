FactoryBot.define do
  factory :project do
    title { Faker::String.random }
    description { Faker::String.random }
    user
  end
end
