require 'rails_helper'

RSpec.describe TagBattle, :type => :model do
  it 'has a valid factory' do
    battle = build(:tag_battle)
    expect(battle).to be_valid
  end

  it 'must belong to a user' do
    battle = build(:tag_battle, user_id: nil)
    expect(battle).to_not be_valid
  end

  it 'must be attached to Tag1' do
    battle = build(:tag_battle, tag1_id: nil)
    expect(battle).to_not be_valid
  end

  it 'must be attached to Tag2' do
    battle = build(:tag_battle, tag2_id: nil)
    expect(battle).to_not be_valid
  end

  it 'must have different tags for tag1 and tag2' do
    tag = build(:hashtag)
    battle = build(:tag_battle, tag1: tag, tag2: tag)

    expect(battle).to_not be_valid
  end

  it 'creates hashtag 1 if a matching one does not exist' do
    user = create(:user)
    battle = TagBattle.create_battle(user, 'abc', 'def', 'some description')
    tag1 = Hashtag.where(name: 'abc').first
    expect(tag1.id).to eq(battle.reload.tag1_id)
  end

  it 'creates hashtag 2 if a matching one does not exist' do
    user = create(:user)
    battle = TagBattle.create_battle(user, 'abc', 'def', 'some description')
    tag2 = Hashtag.where(name: 'def').first
    expect(tag2.id).to eq(battle.reload.tag2_id)
  end

end
