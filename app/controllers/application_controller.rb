class ApplicationController < ActionController::Base
  add_flash_types :success

  protect_from_forgery with: :exception

  # include Pagy::Backend

  before_action :configure_permitted_parameters, if: :devise_controller?

  def set_link
    @link = Link.find(params[:id])
  end

  protected

    # * Permit new fields (e.g., first_name, last_name) in sign up and account update
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end
end
