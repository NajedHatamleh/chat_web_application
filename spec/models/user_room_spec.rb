require 'rails_helper'

RSpec.describe UserRoom, type: :model do

  before(:all) do
    @room1 = FactoryBot.create(:room)
  end

  it 'is has unique name' do
    room2 = FactoryBot.build(:room, name: 'test1')
    expect(room2).to_not be_valid
  end
end
