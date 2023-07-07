class TasksController < ApplicationController
  before_action :move_to_root

  def index
    @room = Room.find(params[:room_id])
    @users = @room.users
    @tasks = @room.tasks.includes(:user)
    
    @comments = @tasks.comments
  end

  def new
    @task = Task.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @task = @room.tasks.new(task_params)
    if @task.save
      redirect_to room_tasks_path(@room)
    else
      :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
    @comment = Comment.new
    @comments = @task.comments.includes(:user)
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to room_tasks_path(@room)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to room_tasks_path(@room)
  end

  private

  def move_to_root
    @room = Room.find(params[:room_id])
    unless @room.users.include?(current_user)
      redirect_to root_path
    end
  end

  def task_params
    params.require(:task).permit(:content,:frequency_id,:when).merge(user_id: current_user.id)
  end

end