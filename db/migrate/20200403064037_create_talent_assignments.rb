class CreateTalentAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :talent_assignments do |t|
      t.date :engaged_date
      t.date :start_date
      t.date :end_date
      t.references :finalized_request, foreign_key: true
      t.references :expert_application, foreign_key: true

      t.timestamps
    end
  end
end
