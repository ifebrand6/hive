class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :superadmin_role, :boolean, :default => false
    add_column :users, :admin_role, :boolean, :default => false
    add_column :users, :customer_role, :boolean, :default => false
  end
end
