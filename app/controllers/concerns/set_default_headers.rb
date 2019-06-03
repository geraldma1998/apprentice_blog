# frozen_string_literal: true

module SetDefaultHeaders

  extend ActiveSupport::Concern

  included do
    before_action :set_default_header_information
  end

  private

  def set_default_header_information
    @header_title = "Apprentice Blog"
    @header_subtitle = "A blog about nothing"
    @header_image = "/assets/home-bg.jpg"
  end

end
