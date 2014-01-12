class MembershipsController < ApplicationController

  def create
    group = current_user.groups.find(params[:group_id])

    # @membership = Membership.new(membership_params)

    @membership = group.memberships.build(membership_params)
    if @membership.save
      redirect_to group_path(group)
    else
      flash[:notice] = "User does not exist"
      redirect_to :back
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:email)
  end

end