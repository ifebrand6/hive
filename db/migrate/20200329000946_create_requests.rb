class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
