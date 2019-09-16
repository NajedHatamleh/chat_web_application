require 'rails_helper'

RSpec.describe RoomChannel, type: :channel do
  let(:user) { FactoryBot.build(:user) }
	before do
    # initialize connection with identifiers
    stub_connection user_id: user.id
  end

  it "rejects subscription" do
    stub_connection user_id: nil
    subscribe
    expect(subscription).to be_rejected
  end

  it "rejects when no room id" do
    subscribe
    expect(subscription).to be_nil
  end

  it "subscribes to a stream when room id is provided" do
    subscribe(room_id: 45)

    expect(subscription).to be_confirmed
  end
end
