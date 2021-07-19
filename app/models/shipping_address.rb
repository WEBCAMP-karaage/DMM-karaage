class ShippingAddress < ApplicationRecord
  belongs_to :customer

  def shipping_address_all
    "〒" + self.postal_code + ' ' + self.address + ' ' + self.name
  end
end
