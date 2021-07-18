class Customer::CustomersController < ApplicationController
  def show
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render :edit
    end
  end

  def check
  end

  def out
    @customer = Customer.find(current_customer.id)
    @customer.update(withdrawal_flag: true)
    # sessionIDのリセットを行う
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :kana_first_name, :kana_last_name, :email, :postal_code, :address, :phone_number)
  end
end
