class RemoveExpertFromTalentTypes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :talent_types, :expert, foreign_key: true
  end
end
