# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do

  describe ":username validations" do
    subject(:user) { FactoryBot.create(:user) }

    it { expect(user).to validate_length_of(:username).is_at_least(1).is_at_most(50) }

    it { expect(user).to validate_uniqueness_of(:username) }

    it { expect(user).to validate_presence_of(:username) }
  end

  describe ":email validations" do
    it { is_expected.to validate_presence_of(:email) }
  end

  describe ":password validations" do
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(128) }

    it { is_expected.to validate_presence_of(:password) }
  end
end
