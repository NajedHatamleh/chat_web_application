class RoomsController < ApplicationController
  before_action :authenticate_user!
  def show

  end

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new permitted_parameters
    debugger
    if @room.save
      flash[:success] = "Room #{@room.name} wass created successfully"
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
      flash[:error_messages] = "Room wasn't updated"
      render :new
    end
  end

  protected

  def permitted_parameters
    params.require(:room).permit(:name)
  end

end
