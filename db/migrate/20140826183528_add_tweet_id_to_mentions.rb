class AddTweetIdToMentions < ActiveRecord::Migration
  def change
    add_column :mentions, :tweet_id, :integer
    add_index :mentions, :tweet_id
    add_index :mentions, [:hashtag_id, :tweet_id], unique: true
  end
end
