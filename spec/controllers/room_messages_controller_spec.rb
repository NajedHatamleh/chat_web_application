require 'rails_helper'

RSpec.describe RoomMessagesController, type: :controller do
  before do
    login_user
  end

  context 'Broadcast a message' do
    let(:room_message) { FactoryBot.build(:room_message) }
    it 'gets room, user then ' do
      params = room_message
      debugger
      expect { post :create, params: params }.to  have_broadcasted_to(room_message.room_id).with(message: room_message)
    end
  end
end
