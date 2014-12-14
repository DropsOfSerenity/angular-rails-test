class ApplicationController < ActionController::Base
  respond_to :json, :html
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_paramaters, if: :devise_controller?

  def index
  end

  private

  def configure_permitted_paramaters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end

end
