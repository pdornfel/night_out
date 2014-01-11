class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
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