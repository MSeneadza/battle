require 'rails_helper'

RSpec.describe Mention, :type => :model do
  it 'has a valid factory' do
    tweet = build(:mention)
    expect(tweet).to be_valid
  end

  it 'is invalid without an attached Hashtag' do
    tweet = build(:mention, hashtag: nil)
    expect(tweet).to_not be_valid
  end

  it 'can find the newest mention' do
    tweet1 = create(:mention, published_at: 2.days.ago)
    tweet2 = create(:mention, published_at: 1.day.ago)
    tweet3 = create(:mention, published_at: 2.minutes.ago)

    newest_mention = Mention.most_recent.first
    expect(newest_mention).to eq(tweet3)
  end

  it 'can find the max tweet id across all hashtags' do
    hashtag1 = create(:hashtag)
    hashtag2 = create(:hashtag)
    hashtag3 = create(:hashtag)
    tweet1 = create(:mention, hashtag: hashtag1, published_at: 2.days.ago)
    tweet2 = create(:mention, hashtag: hashtag2, published_at: 1.day.ago)
    tweet3 = create(:mention, hashtag: hashtag3, published_at: 2.minutes.ago)

    max_id = Mention.max_tweet_id
    expect(max_id).to eq(tweet3.tweet_id)
  end

  it 'returns zero for the max tweet id if no mentions exist' do

    max_id = Mention.max_tweet_id
    expect(max_id).to eq(0)
  end

  it 'can find the min tweet id across all hashtags' do
    hashtag1 = create(:hashtag)
    hashtag2 = create(:hashtag)
    hashtag3 = create(:hashtag)
    tweet1 = create(:mention, hashtag: hashtag1, published_at: 2.days.ago)
    tweet2 = create(:mention, hashtag: hashtag2, published_at: 1.day.ago)
    tweet3 = create(:mention, hashtag: hashtag3, published_at: 2.minutes.ago)

    min_id = Mention.min_tweet_id
    expect(min_id).to eq(tweet1.tweet_id)
  end

  it 'returns zero for the max tweet id if no mentions exist' do

    min_id = Mention.min_tweet_id
    expect(min_id).to eq(0)
  end
end
