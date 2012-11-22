FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@myhost.com"
  end

  sequence :password do |n|
    "Password_#{n}_#{n}"
  end

  factory :user, aliases: [:author, :commenter] do
    name "Test Name"
    email
    password
  end

  factory :story do
    title "Test story title"
    association :user, name: "User name"
    association :author, name: "Author name"
    description "Descriprion created at #{ Time.now }"
  end

  factory :story_comment do
    story_id 12
    comment ""
    user_id 1
  end
end