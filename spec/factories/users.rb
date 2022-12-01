FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST_EMAIL#{n}"}
    sequence(:role) { 0 }
  end
end
