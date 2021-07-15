class ApplicationController < ActionController::Base
  # デバイスを利用するときに、emailの受け渡しを許可する
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
