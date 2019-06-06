# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsController, type: :controller do
  let(:global_user) { FactoryBot.create(:user) }
  let(:global_post) { FactoryBot.create(:post) }

  before do
    sign_in global_user
    # FactoryBot.create(:ranking, post: global_post, user: global_user)
  end

  describe "GET #index" do
    let(:posts) do
      FactoryBot.create_list(:post, 3)
    end

    context "when the request is valid" do
      before { get :index }

      it "renders the index view" do
        expect(response).to render_template(:index)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @posts" do
        expect(assigns(:posts)).to match(posts.sort_by(&:created_at).reverse)
      end
    end
  end

  describe "GET #show" do
    let(:post) { FactoryBot.create(:post) }
    let(:post_id) { post.id }
    let(:params) do
      {
        id: post_id,
      }
    end

    context "when the request is valid" do
      before { get :show, params: params }

      it "renders the show view" do
        expect(response).to render_template(:show)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @post" do
        expect(assigns(:post)).to match(post)
      end
    end
  end

  describe "GET #new" do

    context "when the request is valid" do
      before { get :new }

      it "renders the new view" do
        expect(response).to render_template(:new)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @post exists" do
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  end

  describe "POST #create" do

    let(:current_post) { FactoryBot.attributes_for(:post) }

    let(:params) do
      {
        post: current_post,
      }
    end

    context "when the request is valid" do

      before { post :create, params: params }

      it "returns status code :found" do
        expect(response).to have_http_status(:found)
      end

    end
  end

end
