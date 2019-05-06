require 'rails_helper'

RSpec.describe User, type: :model do
	describe 'validations' do
		subject { FactoryBot.create(:user) }

	  it 'Validate username length' do 
	  	should validate_length_of(:username).is_at_least(1).is_at_most(50)
	  end

	  it 'Validates unique username' do 
	  	should validate_uniqueness_of(:username)
	  end

	  it 'Should validate presence of usernames in User Object' do
	  	should validate_presence_of(:username)
	  end
  end
end