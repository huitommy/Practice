class MessagesController < ApplicationController

  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @messages = @chatroom.messages
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = 'Message sent!'
      redirect_to chatroom_path(@chatroom)
    else
      flash[:error] = @message.errors.full_messages.join(', ')
      render 'chatrooms/show'
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :username, :chatroom_id)
  end
end
