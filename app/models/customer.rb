class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :shipping_addresses, dependent: :destroy

  def active_for_authentication?
    super && (self.withdrawal_flag == false)
  end
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
end
