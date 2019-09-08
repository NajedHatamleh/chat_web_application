class RoomChannel < ApplicationCable::Channel
  # before_action
  def subscribed
    debugger
    # room = Room.find params[:room]
    # stream_for room
		stream_from "room_#{params[:room]}"
		# debugger
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
