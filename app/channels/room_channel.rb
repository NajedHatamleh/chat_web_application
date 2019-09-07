class RoomChannel < ApplicationCable::Channel
  def subscribed
    # room = Room.find params[:room]
    # stream_for room
		stream_from "room_73"
		debugger
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
