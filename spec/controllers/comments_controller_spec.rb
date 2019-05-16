# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "GET #index" do
    let(:comments) { FactoryBot.create_list(:comment, 3) }

    context "when the request is valid" do
      before { get :index }

      it "renders the index view" do
        expect(response).to render_template(:index)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @comments" do
        expect(assigns(:comments)).to match(comments)
      end
    end
  end

  describe "GET #show" do
    let(:current_comment) { FactoryBot.create(:comment) }
    let(:comment_id) { current_comment.id }
    let(:params) do
      {
        id: comment_id,
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

      it "validates @comment" do
        expect(assigns(:comment)).to match(current_comment)
      end
    end
  end

  describe "GET #edit" do
    let(:current_comment) { FactoryBot.create(:comment) }
    let(:comment_id) { current_comment.id }
    let(:params) do
      {
        id: comment_id,
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

      it "validates @comment exists" do
        expect(assigns(:comment)).to match(current_comment)
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

      it "validates @comment exists" do
        expect(assigns(:comment)).to be_a_new(Comment)
      end
    end
  end

  describe "POST #create" do

    let(:current_comment) { FactoryBot.attributes_for(:comment) }

    let(:params) do
      {
        comment: current_comment,
      }
    end

    context "when the request is valid" do

      before { post :create, params: params }

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

    end
  end

  describe "POST #update" do

    let(:current_comment) { FactoryBot.create(:comment) }
    let(:comment_id) { current_comment.id }
    let(:updated_comment) { FactoryBot.attributes_for(:comment) }

    let(:params) do
      {
        id: comment_id,
        comment: updated_comment,
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

    let(:current_comment) { FactoryBot.create(:comment) }
    let(:comment_id) { current_comment.id }

    let(:params) do
      {
        id: comment_id,
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
