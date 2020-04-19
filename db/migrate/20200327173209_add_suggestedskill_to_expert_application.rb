class AddSuggestedskillToExpert < ActiveRecord::Migration[5.2]
  def change
    add_column :experts, :suggested_skill, :string, limit:50, :default => nil
  end
end
