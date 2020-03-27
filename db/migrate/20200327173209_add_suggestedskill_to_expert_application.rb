class AddSuggestedskillToExpertApplication < ActiveRecord::Migration[5.2]
  def change
    add_column :expert_applications, :suggested_skill, :string, limit:50, :default => nil
  end
end
