class Customer::OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    order.save
    # カートテーブルのレコードから注文商品テーブルを作成する
    current_customer.cart_products.each do |item|
      order_product = OrderProduct.new
      order_product.order_id = order.id
      order_product.product_id = item.product.id
      order_product.quantity = item.quantity
      order_product.order_price = item.sub_price
      order_product.save
    end
    current_customer.cart_products.destroy_all
    redirect_to orders_done_path
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
      if params[:order][:shipping_address_option] == ""
        redirect_to new_order_path

      else shipping_address = ShippingAddress.find(params[:order][:shipping_address_option])
      @order.postal_code = shipping_address.postal_code
      @order.name = shipping_address.name
      @order.address = shipping_address.address
      end

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
      @order.address = params[:order][:address]

    else
      redirect_to new_order_path
    end

  end

  def done
  end

  def index
    @orders = current_customer.orders
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

  private
  def order_params
    params.require(:order).permit(:customer_id, :shipping_cost, :total_price, :payment_method, :name, :address, :postal_code)
  end

end
