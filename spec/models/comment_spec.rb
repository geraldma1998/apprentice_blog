# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do

  describe "validations" do
    subject(:comment) do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user: user)
      FactoryBot.create(:comment, user: user, post: post)
    end

    it { expect(comment).to validate_presence_of(:message) }
  end
end
