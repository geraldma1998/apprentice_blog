# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe ':username validations' do
    subject { FactoryBot.create(:user) }

    it 'Should validate username length' do
      should validate_length_of(:username).is_at_least(1).is_at_most(50)
    end

    it 'Should validates unique username' do
      should validate_uniqueness_of(:username)
    end

    it 'Should validate presence of usernames' do
      should validate_presence_of(:username)
    end
  end
  describe ':email validations' do
    it 'Should validate presence of email' do
      should validate_presence_of(:email)
    end
  end

  describe ':password validations' do
    it 'Should validate password length' do
      should validate_length_of(:password).is_at_least(6).is_at_most(128)
    end

    it 'Should validate presence of password' do
      should validate_presence_of(:password)
    end
  end
end
