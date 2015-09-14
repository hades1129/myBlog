class CommentsController < ApplicationController
  def index
    @messages = Message.all
  end
  def new 
    @message = Message.new
  end
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to events_url
    else
      render :action => :new
    end
    flash[:notice] = "message was successfully created"
  end
  def show
  end 
  private

  def message_params
    params.require(:message).permit(:name, :content)
  end
  def set_message
    @message = Message.find(params[:id])
  end
end
