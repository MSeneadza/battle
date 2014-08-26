# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag_battle do
    user
    association :tag1, factory: :hashtag
    association :tag2, factory: :hashtag
    description "My Battle"
  end
end
