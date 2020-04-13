class RemoveExpertApplicationFromTalentTypes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :talent_types, :expert_application, foreign_key: true
  end
end
