# frozen_string_literal: true

require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do

    before do
      get :index
    end

    it { is_expected.to render_template("index") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, "/categories").to(action: :index) }
  end

  describe "GET #new" do

    before do
      get :new
    end

    it { is_expected.to render_template("new") }

    it { is_expected.to render_with_layout("application") }
  end

  describe "GET #edit" do
    let(:category) { FactoryBot.create(:category) }

    before do
      get :edit, params: { id: category.id }
    end

    it { is_expected.to render_template("edit") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, ("/categories/" + category.id.to_s + "/edit")).to(action: :edit, id: category.id) }
  end

  describe "GET #show" do
    let(:category) { FactoryBot.create(:category) }

    before do
      get :show, params: { id: category.id }
    end

    it { is_expected.to render_template("show") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, ("/categories/" + category.id.to_s)).to(action: :show, id: category.id) }
  end

end
