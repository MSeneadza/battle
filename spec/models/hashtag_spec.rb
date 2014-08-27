require 'rails_helper'

RSpec.describe Hashtag, :type => :model do
  it 'has a valid factory' do
    tag = build(:hashtag)
    expect(tag).to be_valid
  end

  it 'is invalid without a name' do
    tag = build(:hashtag, name: nil)
    expect(tag).to_not be_valid
  end

  it 'has unique names' do
    tag1 = create(:hashtag, name: 'Name 1')
    tag2 = build(:hashtag, name: 'Name 1')
    expect(tag2).to_not be_valid
  end

  it 'ignores case when checking name uniqueness' do
    tag1 = create(:hashtag, name: 'Name 1')
    tag2 = build(:hashtag, name: 'name 1')
    expect(tag2).to_not be_valid
  end

  it 'strips off any leading pound signs from the name' do
    tag = build(:hashtag, name: '#something')
    tag.save

    expect(tag.reload.name).to eq('something')
  end

  it 'adds a pound sign to the name for display' do
    tag = build(:hashtag, name: '#something')
    tag.save

    expect(tag.reload.display_name).to eq('#something')
  end

  it 'knows how many times it has been tweeted since a given time' do
    tag1 = create(:hashtag, name: 'Name_1', created_at: 30.hours.ago)
    tweet1 = create(:mention, hashtag: tag1, published_at: 36.hours.ago, twitter_user_id: 1)
    tweet2 = create(:mention, hashtag: tag1, published_at: 24.hours.ago, twitter_user_id: 2)
    tweet3 = create(:mention, hashtag: tag1, published_at: 2.minutes.ago, twitter_user_id: 3)

    expect(tag1.mentions_since(tag1.created_at)).to eq(2)
  end

  # it 'can find all hashtags which are attached to battles' do
  #   tag1 = create(:hashtag)
  #   tag2 = create(:hashtag)
  #   tag3 = create(:hashtag)
  #
  #   battle = create(:tag_battle, tag1: tag1, tag2: tag3)
  #
  #   tags_with_battles = Hashtag.all_in_battles
  #   expect(tags_with_battles.count).to eq(2)
  # end
end
