class Customer::OrdersController < ApplicationController
  def create
  end

  def new
    @order = Order.new
  end

  def confilm
    @order = Order.new
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800


  end

  def done
  end

  def index
  end

  def show
  end
end
