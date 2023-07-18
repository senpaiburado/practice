class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def index
        @products = Product.all
    end

    def about

    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :shipping_address])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :shipping_address])
    end
end
