class RoomMessagesController < ApplicationController
  before_action :load

  def create
    @room_message = RoomMessage.create(user: current_user,
                                       room: @room,
                                       message: params.dig(:room_message, :message))
    # RoomChannel.broadcast_to @room, @room_message
    ActionCable.server.broadcast("room_#{@room.id}", @room_message)
  end

  protected

  def load
    @room = Room.find params.dig(:room_message, :room_id)
    # debugger
  end
end
