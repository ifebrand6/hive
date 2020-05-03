class AddDeletedAtToTalentRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :talent_requests, :deleted_at, :datetime
    add_index :talent_requests, :deleted_at
  end
end
