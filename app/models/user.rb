class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :shops
  has_one :account

  def full_name
    "#{first_name} #{last_name}".strip
  end

  def shop_ready?
    # completed_profile?
      # && billing_information?
      # && active_plan?
  end
end
