class TasksController < ApplicationController
  before_action :move_to_root

  def index
    @room = Room.find(params[:room_id])
    @users = @room.users
  end

  private

  def move_to_root
    @room = Room.find(params[:room_id])
    unless @room.users.include?(current_user)
      redirect_to root_path
    end
  end

end