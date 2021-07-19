class CartProduct < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    def  add_tax_price
      (self.product.non_taxed_price * 1.10).round
    end
    def sub_price
      add_tax_price * self.quantity
    end
    
end
