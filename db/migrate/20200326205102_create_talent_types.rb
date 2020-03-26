class CreateTalentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :talent_types do |t|
      t.string :expert_specialization, limit: 50

      t.timestamps
    end
    add_index :talent_types, :expert_specialization, unique: true
  end
end
