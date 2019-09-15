require 'rails_helper'
require "cancan/matchers"

describe "User" do
  describe "abilities" do
    subject(:ability) { Ability.new(user) }
    let(:user){ nil }

    context "when is an Admin account" do
      let(:user){ FactoryBot.build(:user, admin: true) }

      it { is_expected.to be_able_to(:manage, :all) }
    end
  end
end
