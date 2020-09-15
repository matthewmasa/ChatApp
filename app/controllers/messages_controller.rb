class MessagesController < ApplicationController
  def index
    @message= Message.new
    @room= Room.find_by(params[:room_id])
  end

  def new
    @message=Message.new
  end

  def create
    @room= Room.find_by(params[:room_id])
    @message=@room.messages.new(message_params)
    if message.create
      redirect_to room_message_path
    else
      render :index
    end
  end

  private
   def message_params
     params.require(:message).permit(:content).merge(user_id: current_user.id)
   end
end
