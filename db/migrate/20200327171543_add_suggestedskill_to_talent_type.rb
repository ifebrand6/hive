class AddSuggestedskillToTalentType < ActiveRecord::Migration[5.2]
  def change
    add_column :talent_types, :suggested_skill, :string, limit:50, :default => nil
  end 
end
