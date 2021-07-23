class CartProduct < ApplicationRecord
    belongs_to :customer
    belongs_to :product
    def  add_tax_price
      (self.product.non_taxed_price * 1.10).round
    end
    def sub_price
      add_tax_price * self.quantity
    end

    def total_price
      @sum = 0
      self.to_a.each do |product|
        @sum += product.sub_price
      end
      return @sum
    end

    with_options presence: true do
      validates :customer_id
      validates :product_id
      validates :quantity
    end

end
