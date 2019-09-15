require 'rails_helper'

RSpec.describe UserRoom, type: :model do

  before(:all) do
    @room1 = FactoryBot.build(:room)
  end

  it 'is has unique name' do
    room2 = FactoryBot.build(:room, name: 'test2')
    expect(room2).to be_valid
  end
end
