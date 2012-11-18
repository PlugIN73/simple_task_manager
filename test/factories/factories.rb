FactoryGirl.define do
  factory :user do
    name "John"
    email "test@test.ru"
    password  "12345"
  end

  factory :story do
    title "story"
    state "created"
    user_id 1
    description "description"
    author_id 1
  end

  factory :story_comment do
    story_id 1
    comment "new comment"
    user_id 1
  end
end