class AddEmailToTalents < ActiveRecord::Migration[5.2]
  # this a migration to add user contact details, 
  # in calse a guest user do not sign up so admin can yet get their mail for feedback
 # AddEmail&PhoneNumber to Request is the proper naming.
  def change
    add_column :requests, :email, :string
    add_column :requests, :phoneNumber, :string
  end
end