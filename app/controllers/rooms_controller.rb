class RoomsController < ApplicationController

  def index
  end

  def new
    @user = current_user
  end

  def create
    partner_user = User.find_by(pin: params[:pin])
    
    @room = Room.new
    @room.users << current_user
    @room.users << partner_user

    if @room.save
      current_user.room = @room 
      partner_user.room = @room 
      partner_user.save
      redirect_to rooms_tasks_path(@room)
    else
      render :new
    end
  end

  def join_action
    user = current_user 
    room_id = user.rooms.first.id 
    redirect_to room_tasks_path(room_id)
  end

  private

  def params
      params.permit(:pin)
  end

  
end
