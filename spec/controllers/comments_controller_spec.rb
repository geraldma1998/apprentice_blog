# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "GET #index" do

    before do
      get :index
    end

    it { is_expected.to render_template("index") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, "/comments").to(action: :index) }
  end

  describe "GET #new" do

    before do
      get :new
    end

    it { is_expected.to render_template("new") }

    it { is_expected.to render_with_layout("application") }
  end

  describe "GET #edit" do
    let(:comment) do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user: user)
      FactoryBot.create(:comment, user: user, post: post)
    end

    before do
      get :edit, params: { id: comment.id }
    end

    it { is_expected.to render_template("edit") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, ("/comments/" + comment.id.to_s + "/edit")).to(action: :edit, id: comment.id) }
  end

  describe "GET #show" do
    let(:comment) do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user: user)
      FactoryBot.create(:comment, user: user, post: post)
    end

    before do
      get :show, params: { id: comment.id }
    end

    it { is_expected.to render_template("show") }

    it { is_expected.to render_with_layout("application") }

    it { is_expected.to route(:get, ("/comments/" + comment.id.to_s)).to(action: :show, id: comment.id) }
  end
end
