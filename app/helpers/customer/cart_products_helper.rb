module Customer::CartProductsHelper
    def total_price(cart_products)
        @sum = 0
        cart_products.each do|cart_product|
          @sum += cart_product.sub_price
        end
        return @sum 
    end
end
