class Admin::OrderProductsController < ApplicationController
  def update
    order_product = OrderProduct.find(params[:id])
    product_status = params[:order_product][:product_status].to_i
    order_product.update(product_status: product_status)
    
    @order = order_product.order
    if product_status == 2
       @order.order_status = 2
       @order.save
    end
    if @order.order_products.all? { |order_product| order_product.product_status_before_type_cast == 3}
        @order.order_status = 3
        @order.save
    end
    redirect_to request.referer
  end
end
