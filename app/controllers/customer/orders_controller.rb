class Customer::OrdersController < ApplicationController
  def create
  end
  
  def new
  end
  
  def confilm
  end
  
  def done
  end
  
  def index
    @orders = current_customer.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products
  end
end
