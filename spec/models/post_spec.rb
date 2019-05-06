require 'rails_helper'

RSpec.describe Post, type: :model do
	describe ":title validations" do
    subject { FactoryBot.create(:post) }
    
    it "validate title length" do
      should validate_length_of(:title).is_at_least(1).is_at_most(100)
    end
  end
end
