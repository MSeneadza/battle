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
end
