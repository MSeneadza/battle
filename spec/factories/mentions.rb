# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mention do
    hashtag
    message "MyString"
    published_at Time.now

    sequence :tweet_id do |n|
      n
    end
  end
end
