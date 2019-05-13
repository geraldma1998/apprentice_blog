# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do
  subject(:post) { FactoryBot.create(:post) }

  describe ":title validations" do
    it { expect(post).to validate_length_of(:title).is_at_least(1).is_at_most(100) }

    it { expect(post).to validate_presence_of(:title) }
  end

  describe ":content attribute validations" do
    it { expect(post).to validate_presence_of(:content) }
  end

  describe ":opened attribute validations" do
    it { expect(post).to validate_presence_of(:opened) }
  end
end
