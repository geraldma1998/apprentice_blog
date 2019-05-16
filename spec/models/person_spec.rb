# frozen_string_literal: true

require "rails_helper"

RSpec.describe Person, type: :model do
  describe "validations" do
    subject(:person) do
      user = FactoryBot.create(:user)
      FactoryBot.create(:person, user: user)
    end

    it { expect(person).to validate_length_of(:phone_number).is_at_least(1).is_at_most(9) }

    it { expect(person).to validate_presence_of(:phone_number) }

    it { is_expected.to validate_presence_of(:identification) }
  end

end
