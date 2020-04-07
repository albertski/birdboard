FactoryBot.define do
  factory :project do
    title { Faker::Lorem.words(15).join(' ') }
    description { Faker::Lorem.sentences(3).join(' ') }
    notes { Faker::Lorem.sentences(5).join(' ') }
    user
  end
end
