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

end
