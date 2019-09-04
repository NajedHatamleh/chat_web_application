class RoomsController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource :except => :create
  def show

  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    debugger
    @room = Room.new(room_creation_parameters)
    if @room.save
      flash[:success] = "Room #{@room.name} wass created successfully"
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
    Room.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to rooms_path }
      format.js   { render }
    end
  end

  protected

  def room_creation_parameters
    # debugger
    params.require(:room).permit(:name)
  end

end
