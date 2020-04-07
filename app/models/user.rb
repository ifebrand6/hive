class User < ApplicationRecord
  has_many :requests, dependent: :delete_all
  has_many :talent_requests, dependent: :delete_all
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :send_admin_mail, unless: :guest?
    
    def send_admin_mail
      UserMailer.send_welcome_email(self).deliver_later
    end
end
