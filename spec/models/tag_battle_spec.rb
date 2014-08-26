require 'rails_helper'

RSpec.describe TagBattle, :type => :model do
  it 'has a valid factory' do
    battle = create(:tag_battle)
    expect(battle).to be_valid
  end
end
