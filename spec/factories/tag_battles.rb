# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag_battle do
    user
    tag1_id 1
    tag2_id 2
    description "My Battle"
  end
end
