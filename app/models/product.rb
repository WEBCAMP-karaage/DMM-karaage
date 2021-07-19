class Product < ApplicationRecord
    attachment :image, destroy: false
    has_many :cart_products, dependent: :destroy
    def  add_tax_price
      (self.non_taxed_price * 1.10).round
    end
end
