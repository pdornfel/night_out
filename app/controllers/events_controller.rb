class EventsController < ApplicationController

  before_action :your_groups

  def new
    @event = Event.new
    @group = Group.find(params[:group_id])
  end

  def create
    @event = Event.new(event_params)
    group = Group.find(params[:group_id])
    @event.group = Group.find(params[:group_id])
    @event.user = current_user
    if @event.save
      flash[:success] = "Event Created Successfully"
      redirect_to group_event_path(group, @event)
    else
      flash[:alert] = "Unable to save Event"
      redirect_to group_path(group)
    end
  end

  def show
    @comment = Comment.new
    @event = Event.find(params[:id])
    @group = @event.group
    @proposed_location = ProposedLocation.new
    @proposed_locations = @event.proposed_locations
    @vote = current_user.votes.find_by(event_id: params[:id])
  end

  def edit
    @event = Event.find(params[:id])
    @group = @event.group
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    group = Group.find(params[:group_id])
    flash[:success] = "Group Updated"
    redirect_to group_path(group)
  end

  def your_groups
    @your_groups = current_user.groups
  end

  def destroy
    group = Group.find(params[:group_id])
    event = Event.find(params[:id])
    if event.destroy
      flash[:warning] = "Event destroyed"
      redirect_to group_path(group)
    else
      flash[:alert] = "Unable to delete event"
      redirect_to group_path(group)
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :faketime, :fakedate)
  end

end