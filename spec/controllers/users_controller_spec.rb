# frozen_string_literal: true

require "rails_helper"

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    let(:users) { FactoryBot.create_list(:user, 3) }

    context "when the request is valid" do
      before do
        sign_in(users.first)
        get :index
      end

      it "renders the index view" do
        expect(response).to render_template(:index)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @users" do
        expect(assigns(:users)).to match(users)
      end
    end
  end

  describe "GET #show" do
    let(:current_user) { FactoryBot.create(:user) }
    let(:user_id) { current_user.id }
    let(:params) do
      {
        id: user_id,
      }
    end

    context "when the request is valid" do
      before do
        sign_in(current_user)
        get :show, params: params
      end

      it "renders the show view" do
        expect(response).to render_template(:show)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @user" do
        expect(assigns(:user)).to match(current_user)
      end
    end
  end

  describe "GET #edit" do
    let(:current_user) { FactoryBot.create(:user) }
    let(:user_id) { current_user.id }
    let(:params) do
      {
        id: user_id,
      }
    end

    context "when the request is valid" do
      before do
        sign_in(current_user)
        get :edit, params: params
      end

      it "renders the edit view" do
        expect(response).to render_template(:edit)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @user exists" do
        expect(assigns(:user)).to match(current_user)
      end
    end
  end

  describe "GET #new" do

    let(:current_user) { FactoryBot.create(:user) }

    context "when the request is valid" do
      before do
        sign_in(current_user)
        get :new
      end

      it "renders the new view" do
        expect(response).to render_template(:new)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @user exists" do
        expect(assigns(:user)).to be_a_new(User)
      end
    end
  end

  describe "POST #create" do

    let(:current_user) { FactoryBot.attributes_for(:user) }
    let(:user) { FactoryBot.create(:user) }

    let(:params) do
      {
        user: current_user,
      }
    end

    context "when the request is valid" do

      before do
        sign_in(user)
        post :create, params: params
      end

      it "returns status code :found" do
        expect(response).to have_http_status(:found)
      end

    end
  end

  describe "POST #update" do

    let(:current_user) { FactoryBot.create(:user) }
    let(:user_id) { current_user.id }
    let(:updated_user) { FactoryBot.attributes_for(:user) }

    let(:params) do
      {
        id: user_id,
        user: updated_user,
      }
    end

    context "when the request is valid" do

      before do
        sign_in current_user
        post :update, params: params
      end

      it "returns status code :found" do
        expect(response).to have_http_status(:found)
      end

      it "redirect_to :show" do
        expect(response).to redirect_to(action: :show)
      end

    end
  end

  describe "POST #destroy" do

    let(:current_user) { FactoryBot.create(:user) }
    let(:user_id) { current_user.id }

    let(:params) do
      {
        id: user_id,
      }
    end

    context "when the request is valid" do

      before do
        sign_in current_user
        post :destroy, params: params
      end

      it "returns status code :found" do
        expect(response).to have_http_status(:found)
      end

      it "redirect_to :index" do
        expect(response).to redirect_to(action: :index)
      end

    end
  end
end
