class ApplicationController < ActionController::Base
  before_action :reject_inactive_customer, only: [:create]

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :kana_first_name, :kana_last_name, :address, :postal_code, :phone_number, :withdrawal_flag])
    end

end
