class CreateFinalizedRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :finalized_requests do |t|
      t.references :user, foreign_key: true
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
