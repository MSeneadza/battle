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

end
