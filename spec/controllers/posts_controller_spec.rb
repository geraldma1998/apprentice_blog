# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  describe "GET #index" do

    before do
      get :index
    end

    it { is_expected.to render_template("index") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, "/posts").to(action: :index) }
  end

  describe "GET #new" do

    before do
      get :new
    end

    it { is_expected.to render_template("new") }

    it { is_expected.to render_with_layout("application") }
  end

  describe "GET #edit" do
    let(:post) { FactoryBot.create(:post) }

    before do
      get :edit, params: { id: post.id }
    end

    it { is_expected.to render_template("edit") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, ("/posts/" + post.id.to_s + "/edit")).to(action: :edit, id: post.id) }
  end

  describe "GET #show" do
    let(:post) { FactoryBot.create(:post) }

    before do
      get :show, params: { id: post.id }
    end

    it { is_expected.to render_template("show") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, ("/posts/" + post.id.to_s)).to(action: :show, id: post.id) }
  end
end
