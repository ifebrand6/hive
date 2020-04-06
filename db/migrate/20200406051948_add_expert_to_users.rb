class AddExpertToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :expert, :boolean, :default => false
  end
end
