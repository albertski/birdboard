FactoryBot.define do
  factory :task do
    body { Faker::Lorem.sentences(3).join(' ') }
    completed { Faker::Boolean.boolean}
    project
    user
  end
end
