class VotesController < ApplicationController

def create
  event = ProposedLocation.find(params[:proposed_location_id]).event
  @vote = Vote.new
  @vote.user = current_user
  @vote.proposed_location_id = params[:proposed_location_id]
  if @vote.save
    flash[:notice] = "Your vote is heard"
    redirect_to event_path(event)
  else
    redirect_to root_path
  end
end

end