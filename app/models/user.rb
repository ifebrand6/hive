class User < ApplicationRecord
  has_many :requests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    after_create :send_admin_mail, unless: :guest?

    def self.new_guest
        new { |u| u.guest = true }
    end
    def move_to(user)
      requests.update_all(user_id: current_user.id)
    end
    
    def send_admin_mail
      UserMailer.send_welcome_email(self).deliver_later
    end
end
