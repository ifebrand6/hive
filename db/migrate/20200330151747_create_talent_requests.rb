class CreateTalentRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :talent_requests do |t|
      t.integer :unit_price
      t.integer :expected_contract_duration
      t.date :expected_start_date
      t.integer :quantity, :default => 1
      t.references :user, foreign_key: true
      t.references :request, foreign_key: true
      t.references :talent_type, foreign_key: true

      t.timestamps
    end
  end
end
