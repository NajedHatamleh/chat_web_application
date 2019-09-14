class RoomsController < ApplicationController
  load_and_authorize_resource :except => :create
  skip_authorize_resource :only => :fetch_more

  $limit
  $offset_counter

  def show
    $limit = 5
    $offset_counter = 5
    @rooms = Room.all
    @user_rooms = UserRoom.all
    @room_message = RoomMessage.new room: @room
    $offset_counter = @room.room_messages.includes(:user).size - 5
    @room_messages = @room.room_messages.includes(:user).order(id: :desc).limit($limit)
    $limit += 5
  end

  def index
    @rooms = Room.all
    @user_rooms = UserRoom.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_creation_parameters)
    if @room.save
      @user_room = UserRoom.new({ user_id: current_user.id, room_id: @room.id })
      @user_room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def update
    if @room.update(room_creation_parameters)
      redirect_to rooms_path
    else
      render :new
    end
  end

  # I have there tables that must be destroyed when deleting a room and in the method you see there are only two deletle statments,
  # but because there is an Assosiation between two i only delete one and the other automatically will be deleted
  def destroy
    if can? :destroy, @room
      Room.find(params[:id]).destroy
      UserRoom.where(room_id: params[:id]).map(&:destroy)
    end
    respond_to do |format|
      format.html { redirect_to rooms_path }
      format.js   { render } unless params[:room_scope] == "show"
    end
  end

  def fetch_more
    $limit += 5
    $offset_counter = ($offset_counter >= 5? $offset_counter - 5: 0)

    @room_messages = (@room.room_messages.includes(:user).order(:id).limit($limit).offset($offset_counter)).to_a.reverse()
  end

  # Helper method for finding the creator of the room.
  def find_room_creator(room)
    User.find(UserRoom.where(room_id: room.id).map(&:user_id)).pluck(:username, :email).map {|username, email| {username: username, email: email}}[0]
  end

  helper_method :find_room_creator

  protected

  def room_creation_parameters
    params.require(:room).permit(:name)
  end

end
