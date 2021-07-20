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

end
