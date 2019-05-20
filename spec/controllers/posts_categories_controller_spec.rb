# frozen_string_literal: true

require "rails_helper"

RSpec.describe PostsCategoriesController, type: :controller do

  describe "GET #index" do
    let(:posts_categories) { FactoryBot.create_list(:posts_category, 3) }

    context "when the request is valid" do
      before { get :index }

      it "renders the index view" do
        expect(response).to render_template(:index)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @posts_categories" do
        expect(assigns(:posts_categories)).to match(posts_categories)
      end
    end
  end

  describe "GET #show" do
    let(:posts_category) { FactoryBot.create(:posts_category) }
    let(:posts_category_id) { posts_category.id }
    let(:params) do
      {
        id: posts_category_id,
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

      it "validates @posts_category" do
        expect(assigns(:posts_category)).to match(posts_category)
      end
    end
  end

  describe "GET #edit" do
    let(:posts_category) { FactoryBot.create(:posts_category) }
    let(:posts_category_id) { posts_category.id }
    let(:params) do
      {
        id: posts_category_id,
      }
    end

    context "when the request is valid" do
      before { get :edit, params: params }

      it "renders the edit view" do
        expect(response).to render_template(:edit)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @posts_category exists" do
        expect(assigns(:posts_category)).to match(posts_category)
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

      it "validates @posts_category exists" do
        expect(assigns(:posts_category)).to be_a_new(PostsCategory)
      end
    end
  end

  describe "POST #create" do

    let(:current_post) { FactoryBot.create(:post) }
    let(:category) { FactoryBot.create(:category) }

    let(:posts_category) do
      FactoryBot.attributes_for(:posts_category,
                                post_id: current_post.id,
                                category_id: category.id)
    end

    let(:params) do
      {
        posts_category: posts_category,
      }
    end

    context "when the request is valid" do

      before do
        post :create, params: params
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:found)
      end

    end
  end

  describe "POST #update" do

    let(:current_post) { FactoryBot.create(:post) }
    let(:category) { FactoryBot.create(:category) }

    let(:posts_category) { FactoryBot.create(:posts_category, post_id: current_post.id, category_id: category.id) }
    let(:posts_category_id) { posts_category.id }
    let(:updated_posts_category) do
      FactoryBot.attributes_for(:posts_category,
                                post_id: current_post.id,
                                category_id: category.id)
    end

    let(:params) do
      {
        id: posts_category_id,
        posts_category: updated_posts_category,
      }
    end

    context "when the request is valid" do

      before { post :update, params: params }

      it "returns status code :ok" do
        expect(response).to have_http_status(:found)
      end

      it "redirect_to :show" do
        expect(response).to redirect_to(action: :show)
      end

    end
  end

  describe "POST #destroy" do

    let(:posts_category) { FactoryBot.create(:posts_category) }
    let(:posts_category_id) { posts_category.id }

    let(:params) do
      {
        id: posts_category_id,
      }
    end

    context "when the request is valid" do

      before { post :destroy, params: params }

      it "returns status code :found" do
        expect(response).to have_http_status(:found)
      end

      it "redirect_to :index" do
        expect(response).to redirect_to(action: :index)
      end

    end
  end

end
