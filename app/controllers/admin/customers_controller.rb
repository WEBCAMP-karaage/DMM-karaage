class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def orders
     customer = Customer.find(params[:id])
     @orders = customer.orders.page(params[:page]).per(10)
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
    flash[:success] = "#{@customer.first_name}様の会員情報を更新しました。"
    redirect_to admin_customer_path(@customer)
    else
    flash.now[:danger] = "全ての項目を正しく入力してください"
    render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :address, :phone_number, :withdrawal_flag)
  end
end
