# frozen_string_literal: true

class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permited_parameters, if: :devise_controller?

  before_action :set_default_header_information

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  private
    def set_default_header_information
      @header_title = "Apprentice Blog"
      @header_subtitle = "A blog about nothing"
      @header_image = "assets/home-bg.jpg"
    end
end
