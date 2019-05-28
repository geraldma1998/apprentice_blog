# frozen_string_literal: true

require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  let(:global_user) { FactoryBot.create(:user) }

  before { sign_in global_user }

  describe "GET #index" do
    let(:categories) { FactoryBot.create_list(:category, 3) }

    context "when the request is valid" do
      before { get :index }

      it "renders the index view" do
        expect(response).to render_template(:index)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @categories" do
        expect(assigns(:categories)).to match(categories)
      end
    end
  end

  describe "GET #show" do
    let(:category) { FactoryBot.create(:category) }
    let(:category_id) { category.id }
    let(:params) do
      {
        id: category_id,
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

      it "validates @category" do
        expect(assigns(:category)).to match(category)
      end
    end
  end

  describe "GET #edit" do
    let(:category) { FactoryBot.create(:category) }
    let(:category_id) { category.id }
    let(:params) do
      {
        id: category_id,
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

      it "validates @category exists" do
        expect(assigns(:category)).to match(category)
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

      it "validates @user exists" do
        expect(assigns(:category)).to be_a_new(Category)
      end
    end
  end

  describe "POST #create" do

    let(:category) { FactoryBot.attributes_for(:category) }

    let(:params) do
      {
        category: category,
      }
    end

    context "when the request is valid" do

      before { post :create, params: params }

      it "returns status code :found" do
        expect(response).to have_http_status(:found)
      end

    end
  end

  describe "POST #update" do

    let(:category) { FactoryBot.create(:category) }
    let(:category_id) { category.id }
    let(:updated_category) { FactoryBot.attributes_for(:category) }

    let(:params) do
      {
        id: category_id,
        category: updated_category,
      }
    end

    context "when the request is valid" do

      before { post :update, params: params }

      it "returns status code :found" do
        expect(response).to have_http_status(:found)
      end

      it "redirect_to :show" do
        expect(response).to redirect_to(action: :show)
      end

    end
  end

  describe "POST #destroy" do

    let(:category) { FactoryBot.create(:category) }
    let(:category_id) { category.id }

    let(:params) do
      {
        id: category_id,
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
