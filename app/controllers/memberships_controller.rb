class MembershipsController < ApplicationController

  def create
    group = current_user.groups.find(params[:group_id])
    # @membership = Membership.new(membership_params)

    @membership = group.memberships.build(membership_params)
    # if
      # flash[:notice] = "Member already exists in that group"
      # redirect_to groups_path(group)
    if @membership.save
      flash[:notice] = "User has been added to the group!"
      redirect_to group_path(group)
    elsif @membership.user_id == nil
      flash[:notice] = "User does not exist"
      redirect_to group_path(group)
    else
      flash[:notice] = "User already belongs to group"
      redirect_to group_path(group)
    end
  end

  def destroy
    @membership = Membership.where(group_id: params[:group_id], user_id: params[:id]).first
    @membership.destroy
    if current_user.id == params[:id]
      flash[:notice] = "You have been removed from the group"
      redirect_to groups_path
    else
      name = "#{User.find(params[:id]).first_name} #{User.find(params[:id]).last_name} removed from group"
      flash[:notice] = "#{name} has been removed from group"
      redirect_to group_path(params[:group_id])
    end
  end

  private

  def membership_params
    params.require(:membership).permit(:email)
  end

end