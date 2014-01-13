class GroupsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @your_groups = current_user.groups
  end

  def edit
    @group = Group.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = "#{@group.name} deleted"
    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.users
    @membership = Membership.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.creator = current_user
    if @group.save
      flash[:notice] = "Group successfully created"
      redirect_to groups_path
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :creator)
  end

end