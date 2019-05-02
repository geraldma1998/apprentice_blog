require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_length_of(:username).is_at_least(1).is_at_most(30) }
end
