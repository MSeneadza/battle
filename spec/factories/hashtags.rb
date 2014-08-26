# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hashtag do

    sequence :name do |n|
      "hashtag_#{n}"
    end
  end
end
