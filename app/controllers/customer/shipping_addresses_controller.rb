class Customer::ShippingAddressesController < ApplicationController

  def index
    @shipping_addresses = ShippingAddress.all
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.customer_id = current_customer.id
    if @shipping_address.save
      redirect_to request.referer, notice: "配送先を追加登録しました。"
    else
      @shipping_addresses = ShippingAddress.all
      render 'index'
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to request.referer
  end

  def edit
  end

  def udpate
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:name, :postal_code, :address)
  end

end
