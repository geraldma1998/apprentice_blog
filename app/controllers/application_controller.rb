# frozen_string_literal: true

class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_default_header_information

  before_action :configure_permited_parameters, if: :devise_controller?

  before_action :setup_header_for_login, if: :session_controller?

  before_action :setup_header_for_register, if: :registrations_controller?

  protected

  def configure_permited_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  private

  def set_default_header_information
    @header_title = "Apprentice Blog"
    @header_subtitle = "A blog about nothing"
    @header_image = "/assets/home-bg.jpg"
  end

  def session_controller?
    controller_name == "sessions"
  end

  def registrations_controller?
    controller_name == "registrations"
  end

  def setup_header_for_login
    @header_title = "Login"
    @header_subtitle = "You can enter to the system"
  end

  def setup_header_for_register
    @header_title = "Register"
    @header_subtitle = "You can create an account"
  end

end
