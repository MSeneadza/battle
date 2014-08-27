class AddTwitterUserIdToMention < ActiveRecord::Migration
  def change
    add_column :mentions, :twitter_user_id, :bigint
    add_index :mentions, :twitter_user_id

  end
end
