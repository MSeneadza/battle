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
end
