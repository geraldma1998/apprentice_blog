# frozen_string_literal: true

require "rails_helper"

RSpec.describe Category, type: :model do
  describe ":name validations" do
    subject(:category) { FactoryBot.create(:category) }

    it { expect(category).to validate_length_of(:name).is_at_least(1).is_at_most(50) }

    it { expect(category).to validate_uniqueness_of(:name) }

    it { expect(category).to validate_presence_of(:name) }
  end
end
