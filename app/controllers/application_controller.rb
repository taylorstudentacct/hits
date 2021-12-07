class ApplicationController < ActionController::Base
  respond_to :html, :json
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username first_name last_name
                                               user_type phone_number])

    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[username first_name last_name
                                               user_type phone_number])
  end
end
