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
      validates :address
    end

  # 退会フラグのバリデーション
  validates :withdrawal_flag, inclusion: { in: [true, false] }

  # 正規表現を用いたバリデーションの実装

  # 全角カタカナのみのバリデーション
  VARID_KANA_NAME_REGEX = /\A[ァ-ヶー－]+\z/
  validates :kana_first_name, presence: true, format: { with: VARID_KANA_NAME_REGEX }
  validates :kana_last_name, presence: true, format: { with: VARID_KANA_NAME_REGEX }

  # 郵便番号のバリデーション
  VARID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, presence: true, format: { with: VARID_POSTAL_CODE_REGEX }

  # 電話番号のバリデーション
  VARID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  validates :phone_number, presence: true, format: { with: VARID_PHONE_NUMBER_REGEX}

end
