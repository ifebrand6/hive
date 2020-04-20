class CreateExperts < ActiveRecord::Migration[5.2]
  def change
    create_table :experts do |t|
      t.string :first_name, limit: 30
      t.string :first_name, limit: 30
      t.string :email
      t.integer :phone_number
      t.text :contact_address, limit: 50
      t.text :short_bio, limit: 100
      t.text :certification, array: true, :default => []
      t.boolean :status, default: false
      t.string :suggested_skill, limit:50, :default => nil
      t.timestamps
    end
    add_index :experts, :email, unique: true
  end
end
