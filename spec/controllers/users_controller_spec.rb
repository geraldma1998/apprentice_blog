# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do

    before do
      get :index
    end

    it { is_expected.to render_template("index") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, "/users").to(action: :index) }
  end

  describe "GET #new" do

    before do
      get :new
    end

    it { is_expected.to render_template("new") }

    it { is_expected.to render_with_layout("application") }
  end

  describe "GET #edit" do
    let(:user) { FactoryBot.create(:user) }

    before do
      get :edit, params: { id: user.id }
    end

    it { is_expected.to render_template("edit") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, ("/users/" + user.id.to_s + "/edit")).to(action: :edit, id: user.id) }
  end

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
