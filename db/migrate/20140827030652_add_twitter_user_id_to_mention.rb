class AddTwitterUserIdToMention < ActiveRecord::Migration
  def change
    add_column :mentions, :twitter_user_id, :bigint
  end
end
