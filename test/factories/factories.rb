FactoryGirl.define do
  factory :user do
    name "John"
    email "test@test.ru"
    password  "12345"
  end
  factory :story do
    Title "story"
    State "created"
    User 123
    Description "description"
    Author 123
  end
end