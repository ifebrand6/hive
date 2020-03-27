class CreateExpertApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :expert_applications do |t|
      t.string :firstName, limit: 30
      t.string :lastName, limit: 30
      t.string :email
      t.integer :phoneNumber
      t.text :contactAddress, limit: 50
      t.text :shortBio, limit: 100
      t.text :certification, array: true, :default => []
      t.boolean :status, default: false      
      t.timestamps
    end
    add_index :expert_applications, :email, unique: true
  end
end
