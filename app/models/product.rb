class Product < ApplicationRecord
    attachment :image, destroy: false
    def  add_tax_price
      (self.non_taxed_price * 1.10).round
    end
    has_many :cart_products, dependent: :destroy
end
