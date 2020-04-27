class ContractCostToTalentAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :talent_assignments, :contract_cost, :integer
  end
end
