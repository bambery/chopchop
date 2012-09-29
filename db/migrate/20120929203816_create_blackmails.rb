class CreateBlackmails < ActiveRecord::Migration
  def change
    create_table :blackmails do |t|
      t.references :sender
      t.references :recipient
      t.text :note
      t.datetime :deadline
      t.string :video_url

      t.timestamps
    end
    add_index :blackmails, :sender_id
    add_index :blackmails, :recipient_id
  end
end
