class MytasksController < ApplicationController
  
  def create
    @task = Task.find(params[:task_id])
    @mytask = Mytask.new(user_id: current_user.id, task_id: @task.id)

    if @mytask.save
      redirect_to room_tasks_path(@task.room)
    else
      redirect_to room_tasks_path(@task.room)
    end
  end

end
