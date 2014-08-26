class ModifyTweetIdOnMessages < ActiveRecord::Migration
  def change
    remove_column :mentions, :tweet_id
    add_column :mentions, :tweet_id, :bigint, null: false

    add_index :mentions, :tweet_id
    add_index :mentions, [:hashtag_id, :tweet_id], unique: true
  end
end
