FactoryBot.define do
  factory :task do
    body { Faker::Lorem.sentences(number: 3).join(' ') }
    completed { Faker::Boolean.boolean}
    project
    user
  end
end
