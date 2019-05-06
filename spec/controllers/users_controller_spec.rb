# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Get #show' do
    before do
      @user = FactoryBot.create(:user)
      get :show, params: { id: @user.id }
    end

    it 'Validate that show method render to show view' do
      should render_template('show')
    end

    it 'Validate that show method render with application layout' do
      should render_with_layout('application')
    end

    it 'Validate show route' do
      should route(:get, ('/users/' + @user.id.to_s)).to(action: :show, id: @user.id)
    end
  end
  describe 'Before action validations' do
    it 'Validate before_action call set_user' do
      should use_before_action(:set_user)
    end
  end
end
