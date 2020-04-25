# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  guest                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  superadmin_role        :boolean          default(FALSE)
#  admin_role             :boolean          default(FALSE)
#  customer_role          :boolean          default(TRUE)
#  expert                 :boolean          default(FALSE)
#
class User < ApplicationRecord
  has_many :requests, dependent: :delete_all
  has_many :talent_requests
  has_many :posts
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :send_admin_mail, unless: :guest?

  scope :customers, -> { includes(:requests).where(requests: { user_id: presence }) }

  def send_admin_mail
    UserMailer.send_welcome_email(self).deliver_later
  end
end
