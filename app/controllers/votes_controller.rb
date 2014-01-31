class VotesController < ApplicationController

def create
  event = ProposedLocation.find(params[:proposed_location_id]).event
  @vote = Vote.new
  @vote.user = current_user
  @vote.event = event
  @vote.proposed_location_id = params[:proposed_location_id]
  if @vote.save
    flash[:notice] = "Your vote is heard"
    redirect_to event_path(event)
  else
    flash[:notice] = "You can only vote once"
    redirect_to event_path(event)
  end
end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy
    flash[:notice] = "Vote deleted"
    redirect_to :back
    # event = ProposedLocation.find(params[:proposed_location_id]).event
    # @vote = Vote.find_by(id: params[:id])
    # @vote.destroy
    # redirect_to event_path(event)
  end

end