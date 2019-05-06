require 'rails_helper'

RSpec.describe Post, type: :model do
	describe ":title validations" do
    subject { FactoryBot.create(:post) }
    
    it "validate title length" do
      should validate_length_of(:title).is_at_least(1).is_at_most(100)
    end

    it "validates presence of title" do
      should validate_presence_of(:title)
    end
  end

  describe ":content attribute validations" do
    it "validates presence of content" do
      should validate_presence_of(:content)
    end
  end

  describe ":opened attribute validations" do
    it "validates presence of opened" do
      should validate_presence_of(:opened)
    end
  end
end
