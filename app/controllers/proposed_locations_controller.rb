class ProposedLocationsController < ApplicationController

  def create
    @proposed_location = ProposedLocation.new(location_params)
    @event = Event.find(params[:event_id])
    @proposed_location.event = @event
    if @proposed_location.save
      flash[:notice] = "Location has been proposed"
      redirect_to event_path(@event)
    else
      flash[:alert] = "Proposed location must have name"
      redirect_to event_path(@event)
    end
  end

  private

  def location_params
    params.require(:proposed_location).permit(:name)
  end

end