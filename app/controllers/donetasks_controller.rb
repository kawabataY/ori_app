class DonetasksController < ApplicationController

  def create
    @task = Task.find(params[:task_id])
    @donetask = Donetask.new(user_id: current_user.id, task_id: @task.id)

    if @donetask.save
      redirect_to room_tasks_path(@task.room)
    else
      redirect_to room_tasks_path(@task.room)
    end
  end

end
