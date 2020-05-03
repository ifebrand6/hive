class AddDeletedAtToTalentAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :talent_assignments, :deleted_at, :datetime
    add_index :talent_assignments, :deleted_at
  end
end
