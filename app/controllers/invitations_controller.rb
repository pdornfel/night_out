class InvitationsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    redirect_to group_path(@group)
  end

  def create
    group = Group.find(params[:group_id])
    invitation_email = params[:invitation][:email]
    Mailer.send_invitation(invitation_email, group.id).deliver
    flash[:info] = "You invited #{invitation_email}"
    redirect_to group_path(group)
  end


end