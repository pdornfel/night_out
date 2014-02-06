class InvitationsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    redirect_to group_path(@group)
  end


end