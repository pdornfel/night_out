class EventsController < ApplicationController

  def new
    @event = Event.new
    @group = Group.find(params[:group_id])
  end

  def create
    @event = Event.new(event_params)
    group = Group.find(params[:group_id])
    @event.group = Group.find(params[:group_id])
    if @event.save
      flash[:notice] = "Event Created Successfully"
      redirect_to group_path(group)
    else
      render 'new'
    end
  end


  private

  def event_params
    params.require(:event).permit(:name, :time)
  end

end