class ShippingAddress < ApplicationRecord
  belongs_to :customer

  def shipping_address_all
    "〒" + self.postal_code + ' ' + self.address + ' ' + self.name
  end

  with_options presence: true do
    validates :customer_id
    validates :name
    validates :address
    validates :postal_code
  end

  # 正規表現を使ったバリデーション
  # 郵便番号のバリデーション
  VARID_POSTAL_CODE_REGEX = /\A\d{7}\z/
  validates :postal_code, format: { with: VARID_POSTAL_CODE_REGEX }, allow_blank: true
end
