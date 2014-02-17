class InvitationsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    redirect_to group_path(@group)
  end

  def create
    @group = Group.find(params[:group_id])
    flash[:alert] = "Feature coming soon"
    redirect_to group_path(@group)
  end


end