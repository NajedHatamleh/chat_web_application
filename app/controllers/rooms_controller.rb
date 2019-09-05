class RoomsController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource :except => :create
  def show
    @room_message = UserRoom.new room: @room
    debugger
    @users = @room_message.room
    debugger
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
      # flash[:success] = "Room #{@room.name} wass created successfully"
      @user_room = UserRoom.new({ user_id: current_user.id, room_id: @room.id })
      @user_room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def update
    if @room.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room.name} has been updated successfully"
      redirect_to rooms_path
    else
      flash[:error] = "Room wasn't updated"
      render :new
    end
  end

  def destroy
    if can? :destroy, @room
      Room.find(params[:id]).destroy
      UserRoom.where(user_id: current_user.id, room_id: params[:id]).map(&:destroy)
    end
    respond_to do |format|
      format.html { redirect_to rooms_path }
      format.js   { render }
    end
  end

  def find_room_creator(room)
    creator = User.find(UserRoom.where(room_id: room.id).map(&:user_id)).pluck(:username, :email).flatten
    "Created by User Name: '#{creator.first}'\nEmail: '#{creator.last}' \nAre You sure you want to delete '#{room.name}'?"
  end

  helper_method :find_room_creator

  protected

  def room_creation_parameters
    params.require(:room).permit(:name)
  end

end
