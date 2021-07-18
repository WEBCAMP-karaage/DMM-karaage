class ApplicationController < ActionController::Base
  before_action :reject_inactive_customer, only: [:create]
  before_action :configure_permitted_parameters, if: :devise_controller?

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :address, :postal_code, :phone_number, :withdrawal_flag])
    end

     # 退会済みユーザーのログイン阻止
    def reject_inactive_customer
      @customer = Customer.find_by(email: params[:customer][:email])
      if @customer
        if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
          redirect_to new_customer_session_path
        end
      end
    end

end
