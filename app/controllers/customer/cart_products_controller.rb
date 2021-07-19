class Customer::CartProductsController < ApplicationController


  def index
    @cart_products = current_customer.cart_products
  end


  def create
    if customer_signed_in?
      @cart_product = current_customer.cart_products.new(cart_product_params)
      @product = current_customer.cart_products.find_by(product_id: @cart_product.product_id)
      if @product

        @exsisting_cart_product = current_customer.cart_products.find_by(product_id: @product.product_id)

        @exsisting_cart_product.quantity += params[:cart_product][:quantity].to_i
        @exsisting_cart_product.save
      else
        @cart_product.save
      end

      redirect_to cart_products_path
    end
  end



  def update
    @cart_product = CartProduct.find(params[:id])
    @cart_product.update(quantity: params[:cart_product][:quantity].to_i)
    flash[:notice] = "#{@cart_product.product.name}の数量を変更しました。"
    redirect_to request.referer
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    flash[:alert] = "#{@cart_product.product.name}を削除しました。"
    redirect_to cart_products_path
  end

  def all_destroy
    @cart_products = current_customer.cart_products
    @cart_products.destroy_all
    flash[:alert] = "カートの商品を全て削除しました。"
    redirect_to cart_products_path
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :customer_id, :quantity)
  end

end
