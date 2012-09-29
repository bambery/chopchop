class UpdateBlackmails < ActiveRecord::Migration
  def change
    rename_column :blackmails, :sender_id, :hustler_id
    rename_column :blackmails, :recipient_id, :victim_id
    add_column :blackmails, :amount, :decimal
    add_column :blackmails, :status_cd, :integer 
  end

end
