require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
	before do
		login_user
	end
  context 'GET #index' do
    it 'returns a successful found response' do
      get :index
      assert_response :success
    end
  end

  context 'GET #show' do
		# let(:room) { FactoryBot.build(:room)}
    it 'returns successful found response' do
    	params = {id: 25}
      get :show, params: params
      assert_response :success
    end
  end

  context 'GET #new' do
    it 'returns succeeful found response' do
      get :new
      assert_response :success
    end
  end

  context 'GET #create' do
    it 'creates Room' do
      room = FactoryBot.build(:room, name: "temp")
		  room_params = { room: {name: room.name} }
      expect { post :create, params: room_params }.to change(Room, :count).by(1)
    end
    it 'dosent create a Room' do
      room = FactoryBot.create(:room, name: "text1")
      room_params = { room: {name: room.name} }
      expect { post :create, params: room_params }.to raise_error()
    end
  end

  context 'DELETE #destroy' do
    it 'Deletes Room' do
      room = FactoryBot.create(:room, name: "temp1")
			params = {id: room.id}
      expect { delete :destroy, params: params}.to change(Room, :count).by(-1)
    end
  end

end
