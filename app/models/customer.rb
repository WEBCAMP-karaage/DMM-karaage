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

  with_options presence: true do
      validates :first_name
      validates :last_name
      validates :kana_first_name
      validates :kana_last_name
      validates :postal_code
      validates :phone_number
      validates :address
    end

  # 退会フラグのバリデーション
  validates :withdrawal_flag, inclusion: { in: [true, false] }

  # 正規表現を用いたバリデーションの実装

  # 全角カタカナのみのバリデーション
  VARID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :kana_first_name, format: { with: VARID_KANA_NAME_REGEX }, allow_blank: true
  validates :kana_last_name, format: { with: VARID_KANA_NAME_REGEX }, allow_blank: true

  # 郵便番号のバリデーション
  VARID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, format: { with: VARID_POSTAL_CODE_REGEX }, allow_blank: true

  # 電話番号のバリデーション
  VARID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  validates :phone_number, format: { with: VARID_PHONE_NUMBER_REGEX}, allow_blank: true

end
