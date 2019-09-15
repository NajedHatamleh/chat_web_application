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
    params = {id: 1}
    it 'returns successful found response' do
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
      room_params = FactoryBot.create(:room, name: "new")
      get :room_creation_parameters, params: room_params
      room = response
      expect { post :create, :room => room }.to change(Room, :count).by(1)
    end
  end

  context 'DELETE #destroy' do
    it 'Deletes Room' do
      room = FactoryBot.build(:room, name: "temp")
      expect { delete :destroy, :room => room}.to change(Room, :count).by(-1)
    end
  end

end
