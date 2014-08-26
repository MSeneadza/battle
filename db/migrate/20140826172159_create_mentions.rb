class CreateMentions < ActiveRecord::Migration
  def change
    create_table :mentions do |t|
      t.integer :hashtag_id, null: false
      t.string :message, null: false
      t.datetime :published_at, null: false

      t.timestamps
    end

    add_index :mentions, :hashtag_id
    add_index :mentions, :published_at
    add_index :mentions, :created_at
  end
end
