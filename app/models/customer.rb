class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shipping_address, dependent: :destroy

  def active_for_authentication?
    super && (self.withdrawal_flag == false)
  end
  
end
