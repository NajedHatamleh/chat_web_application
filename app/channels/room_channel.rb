class RoomChannel < ApplicationCable::Channel
  def subscribed
		stream_from "room_#{params[:room]}"
  end

  def unsubscribed
    stop_all_streams
    # Any cleanup needed when channel is unsubscribed
  end
end
