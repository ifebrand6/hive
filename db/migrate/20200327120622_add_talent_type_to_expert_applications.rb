class AddTalentTypeToExperts < ActiveRecord::Migration[5.2]
  def change
    add_reference :experts, :talent_type, foreign_key: true
  end
end
