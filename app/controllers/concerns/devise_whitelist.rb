# frozen_string_literal: true

module DeviseWhitelist

  extend ActiveSupport::Concern

  included do
    before_action :configure_permited_parameters, if: :devise_controller?
  end

  protected

  def configure_permited_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

end
