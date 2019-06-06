# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  let(:global_user) { FactoryBot.create(:user) }

  before { sign_in global_user }

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

    end
  end
end
