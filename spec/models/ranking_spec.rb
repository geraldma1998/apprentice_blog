# frozen_string_literal: true

require "rails_helper"

RSpec.describe Ranking, type: :model do
  describe "validations" do
    subject(:ranking) do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user: user)
      FactoryBot.create(:ranking, user: user, post: post)
    end

    it { expect(ranking).to validate_presence_of(:rank) }
  end
end
