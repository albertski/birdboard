FactoryBot.define do
  factory :project do
    title { Faker::Lorem.words(15).join(' ') }
    description { Faker::Lorem.sentences(3).join(' ') }
    user
  end
end
