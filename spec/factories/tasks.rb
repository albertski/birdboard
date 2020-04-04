FactoryBot.define do
  factory :task do
    body { Faker::Lorem.sentences(3).join(' ') }
    project
    user
  end
end
