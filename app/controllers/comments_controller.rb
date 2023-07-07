class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @task = Task.find(params[:task_id])
    if @comment.save
      redirect_to edit_room_task_path(room_id: @task.room_id, id: @task.id)
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, task_id: params[:task_id])
  end
end
