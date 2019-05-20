# frozen_string_literal: true

require "rails_helper"

RSpec.describe RankingsController, type: :controller do
  describe "GET #index" do
    let(:rankings) { FactoryBot.create_list(:ranking, 3) }

    context "when the request is valid" do
      before do
        get :index
      end

      it "renders the index view" do
        expect(response).to render_template(:index)
      end

      it "returns status code :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "validates @rankings" do
        expect(assigns(:rankings)).to match(rankings)
      end
    end
  end

  describe "GET #show" do
    let(:ranking) { FactoryBot.create(:ranking) }
    let(:ranking_id) { ranking.id }
    let(:params) do
      {
        id: ranking_id,
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

      it "validates @ranking" do
        expect(assigns(:ranking)).to match(ranking)
      end
    end
  end

  describe "GET #edit" do
    let(:ranking) { FactoryBot.create(:ranking) }
    let(:ranking_id) { ranking.id }
    let(:params) do
      {
        id: ranking_id,
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

      it "validates @ranking exists" do
        expect(assigns(:ranking)).to match(ranking)
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

      it "validates @ranking exists" do
        expect(assigns(:ranking)).to be_a_new(Ranking)
      end
    end
  end

  describe "POST #create" do

    let(:ranking) { FactoryBot.attributes_for(:ranking) }

    let(:params) do
      {
        ranking: ranking,
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

    let(:ranking) { FactoryBot.create(:ranking) }
    let(:ranking_id) { ranking.id }
    let(:updated_ranking) { FactoryBot.attributes_for(:ranking) }

    let(:params) do
      {
        id: ranking_id,
        ranking: updated_ranking,
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

    let(:ranking) { FactoryBot.create(:ranking) }
    let(:ranking_id) { ranking.id }

    let(:params) do
      {
        id: ranking_id,
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
