class AddExpertApplicationToTalentTypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :talent_types, :expert_application, foreign_key: true
  end
end
