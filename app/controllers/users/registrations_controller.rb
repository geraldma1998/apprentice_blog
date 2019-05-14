# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  # GET /users/sign_up
  def new
    build_resource({})
    resource.build_person
    respond_with resource
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username,
                                                       person_attributes: %i[
                                                         identification
                                                         phone_number
                                                         first_name
                                                         last_name
                                                       ]])
  end

end
