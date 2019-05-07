# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    let(:user) { FactoryBot.create(:user) }

    before do
      get :show, params: { id: user.id }
    end

    it { is_expected.to render_template("show") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, ("/users/" + user.id.to_s)).to(action: :show, id: user.id) }
  end
end
