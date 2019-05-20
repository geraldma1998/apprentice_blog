# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do
  subject(:post) do
    user = FactoryBot.create(:user)
    FactoryBot.create(:post, user: user)
  end

  describe "validations" do
    it { expect(post).to validate_length_of(:title).is_at_least(1).is_at_most(100) }

    it { expect(post).to validate_presence_of(:title) }

    it { expect(post).to validate_presence_of(:content) }

    it { expect(post).to validate_presence_of(:opened) }
  end

end
