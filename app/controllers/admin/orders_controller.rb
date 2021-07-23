class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
      @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order_status = params[:order][:order_status].to_i
    order.update(order_status: order_status)

    if order_status == 1
      order.order_products.each do |order_product|
        order_product.product_status = 1
        order_product.save
      end
    end
    redirect_to request.referer
  end

end
