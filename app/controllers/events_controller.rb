class EventsController < ApplicationController
  
  before_filter :authenticate_user!, :except => [:show, :index]    
 

  def index
    @events = Event.all
  end
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_url
    else
      render :action => :new
    end
    flash[:notice] = "event was successfully created"

  end
  def show

    #@page_title = @event.name

  end
  def edit

  end
  def update

    if @event.update(event_params)
      redirect_to event_url(@event)
    else
      render :action => :edit
    end
    flash[:notice] = "event was successfully updated"

  end
  def about
  
  end
  
  
  
  def destroy

    @event.destroy
    flash[:alert] = "event was successfully deleted"

    redirect_to events_url
  end
  
  #before_filter :authenticate_user!, :except => [:show, :index]    
  before_action :set_event, :only => [ :show, :edit, :update, :destroy]
  #before_action :authenticate_user!

  private

  def event_params
    params.require(:event).permit(:name, :description)
  end
  def set_event
    @event = Event.find(params[:id])
  end
   
   

end
