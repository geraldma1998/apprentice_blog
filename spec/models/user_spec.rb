# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  describe ":username validations" do
    subject { FactoryBot.create(:user) }

    it "validates username length" do
      expect(subject).to validate_length_of(:username).is_at_least(1).is_at_most(50)
    end

    it "validateses unique username" do
      expect(subject).to validate_uniqueness_of(:username)
    end

    it "validates presence of usernames" do
      expect(subject).to validate_presence_of(:username)
    end
  end

  describe ":email validations" do
    it "validates presence of email" do
      expect(subject).to validate_presence_of(:email)
    end
  end

  describe ":password validations" do
    it "validates password length" do
      expect(subject).to validate_length_of(:password).is_at_least(6).is_at_most(128)
    end

    it "validates presence of password" do
      expect(subject).to validate_presence_of(:password)
    end
  end
end
