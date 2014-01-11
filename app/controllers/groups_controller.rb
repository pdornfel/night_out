class GroupsController < ApplicationController

  def index
    @all_groups = Group.all
    @your_groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    if @group.save
      flash[:notice] = "Group successfully created"
      redirect_to groups_path
    else
      render 'new'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end