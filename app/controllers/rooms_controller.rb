class RoomsController < ApplicationController

  def index
    @room = Room.find(params[:id])
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
      redirect_to root_path
    else
      render :new
    end
  end

  
end
