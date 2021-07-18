class Customer::CartProductsController < ApplicationController
  
  
  def index
    @cart_product = current_customer.cart_products
  end
  
  
  def create
    if customer_signed_in?
      @cart_product = current_customer.cart_products.new(cart_product_params)
      product = CartProduct.find_by(product_id: @cart_product.product_id)
      if product
        redirect_to request.referer, alert: "※既にカートに入っています"
      else
        @cart_product.save
        redirect_to cart_products_path
      end
        
    end
  end
  
  
  
  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    flash[:notice] = "#{@cart_item.item.name}の数量を変更しました。"
    redirect_to request.referer
  end
  
  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    flash[:alert] = "#{@cart_product.product.name}を削除しました。"
    redirect_to customer_cart_product_path
  end
  
  def destroy_all
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    flash[:alert] = "カートの商品を全て削除しました。"
    redirect_to customer_cart_items_path
  end
  
  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :customer_id, :quantity)
  end
  
end
