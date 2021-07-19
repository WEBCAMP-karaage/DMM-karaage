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
    @order.total_price = total_price(current_customer.cart_products)
    @order.payment_method = params[:order][:payment_method]

    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.first_name + current_customer.last_name
      @order.address = current_customer.address

    elsif params[:order][:address_option] == "1"
      shipping_address = ShippingAddress.find(params[:order][:shipping_address_option])
      @order.postal_code = shipping_address.postal_code
      @order.name = shipping_address.name
      @order.address = shipping_address.address

    else
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
      @order.address = params[:order][:address]
    end

  end

  def done
  end

  def index
  end

  def show
  end

  def total_price(cart_products)
    @sum = 0
    cart_products.each do|cart_product|
      @sum += cart_product.sub_price
    end
    return @sum
  end
end
