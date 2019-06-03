# frozen_string_literal: true

module DeviseConfiguration

  extend ActiveSupport::Concern

  included do
    before_action :configure_permited_parameters, if: :devise_controller?
    before_action :setup_header_for_login, if: :session_controller?
    before_action :setup_header_for_register, if: :registrations_controller?
  end

  private

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
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
