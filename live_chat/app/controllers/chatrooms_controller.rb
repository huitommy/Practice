class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:show, :edit, :update, :destroy]

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      flash[:notice] = "You have created the chatroom successfully"
      redirect_to chatroom_path(@chatroom)
    else
      flash[:alert] = @chatroom.errors.full_messages.join(". ")
      render new_chatroom_path
    end
  end

  def show
    @message = Message.new
    @messages = @chatroom.messages
  end

  def edit
  end

  def update
    if @chatroom.update
      flash[:notice] = "You have changed the name of the chatroom successfully"
      redirect_to chatroom_path(@chatroom)
    else
      flash[:alert] = @chatroom.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @chatroom.destroy
    flash[:notice] = "You have deleted the chatroom successfully"
    redirect_to chatrooms_path
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:topic)
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
  end
end
