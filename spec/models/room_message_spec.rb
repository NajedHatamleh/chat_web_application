require 'rails_helper'

RSpec.describe RoomMessage, type: :model do
  describe 'Associations' do
    it 'has one user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end

    it 'has one room' do
      assc = described_class.reflect_on_association(:room)
      expect(assc.macro).to eq :belongs_to
    end


  end
end
