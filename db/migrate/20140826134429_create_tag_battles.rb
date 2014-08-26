class CreateTagBattles < ActiveRecord::Migration
  def change
    create_table :tag_battles do |t|
      t.integer :user_id, null: false
      t.integer :tag1_id, null: false
      t.integer :tag2_id, null: false
      t.string :description, default: ''

      t.timestamps
    end
    add_index :tag_battles, :user_id
    add_index :tag_battles, :tag1_id
    add_index :tag_battles, :tag2_id
  end
end
