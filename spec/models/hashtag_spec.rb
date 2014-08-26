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
end
