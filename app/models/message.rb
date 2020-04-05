class Message   
    include ActiveModel::Model
    attr_accessor :name, :email, :phone_number, :body, :location, :company_about
    validates :name, :email, :phone_number, :body, presence: true
end