# frozen_string_literal: true

require "rails_helper"

RSpec.describe Post, type: :model do
  describe ":title validations" do
    subject { FactoryBot.create(:post) }

    it "validate title length" do
      expect(subject).to validate_length_of(:title).is_at_least(1).is_at_most(100)
    end

    it "validates presence of title" do
      expect(subject).to validate_presence_of(:title)
    end
  end

  describe ":content attribute validations" do
    it "validates presence of content" do
      expect(subject).to validate_presence_of(:content)
    end
  end

  describe ":opened attribute validations" do
    it "validates presence of opened" do
      expect(subject).to validate_presence_of(:opened)
    end
  end
end
