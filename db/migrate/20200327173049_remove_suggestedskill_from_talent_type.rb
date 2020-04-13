class RemoveSuggestedskillFromTalentType < ActiveRecord::Migration[5.2]
  def change
    remove_column :talent_types, :suggested_skill, :string, limit:50, :default => nil
  end
end
