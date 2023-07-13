require "openai"

class ShoppinglistsController < ApplicationController

  def index
    @room = Room.find(params[:room_id])
    @users = @room.users
    @shoppinglists = @room.shoppinglists.includes(:user)
  end

  def new
    @shoppinglist = Shoppinglist.new
    @room = Room.find(params[:room_id])
  end

  def create
    @room = Room.find(params[:room_id])
    @shoppinglist = @room.shoppinglists.new(shoppinglist_params)
    if @shoppinglist.save
      redirect_to room_shoppinglists_path(@room)
    else
      Rails.logger.error(@shoppinglist.errors.full_messages)
      render :new
    end
  end

  def edit
    @room = Room.find(params[:room_id])
    @shoppinglist = Shoppinglist.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @shoppinglist = Shoppinglist.find(params[:id])
    if @shoppinglist.update(shoppinglist_params)
      redirect_to room_shoppinglists_path(@room)
    else
      render :edit
    end
  end

  def delete
    @room = Room.find(params[:room_id])
    @shoppinglist = Shoppinglist.find(params[:id])
    @shoppinglist.destroy
    redirect_to room_shoppinglists(@room)
  end

  def generate_answer
    client = OpenAI::Client.new(access_token:ENV["OPENAI_API_KEY"])
 
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: params[:question] }], 
        max_tokens: 20,
      }
    )
    @answer = response.dig("choices", 0, "message", "content")
    Rails.logger.info("API Response: #{response}") # APIのレスポンスをログに表示

    if @answer.present?
      Rails.logger.info("Answer: #{@answer}") # 回答をログに表示
    else
      Rails.logger.info("No answer received from the API") # 回答がAPIから返ってこなかった場合のログ
    end

    @shoppinglist = Shoppinglist.new
    @room = Room.find(params[:room_id])

    render_new_after_generate_answer
  end

  private

  def shoppinglist_params
    params.require(:shoppinglist).permit(:content).merge(room_id: @room.id, user_id: current_user.id)
  end


  def render_new_after_generate_answer
    render :new
  end

end
