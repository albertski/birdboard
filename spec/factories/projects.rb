FactoryBot.define do
  factory :project do
    title { Faker::Lorem.words(number: 15).join(' ') }
    description { Faker::Lorem.sentences(number: 3).join(' ') }
    notes { Faker::Lorem.sentences(number: 5).join(' ') }
    user
  end
end
