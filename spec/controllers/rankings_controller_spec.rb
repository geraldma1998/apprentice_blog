# frozen_string_literal: true

require "rails_helper"

RSpec.describe RankingsController, type: :controller do
  let(:global_user) { FactoryBot.create(:user) }

  before { sign_in global_user }

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
