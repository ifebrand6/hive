class AddExpectedEndDateToTalentRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :talent_requests, :expected_end_date, :date
  end
end
