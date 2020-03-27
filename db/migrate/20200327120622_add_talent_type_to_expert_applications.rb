class AddTalentTypeToExpertApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :expert_applications, :talent_type, foreign_key: true
  end
end
