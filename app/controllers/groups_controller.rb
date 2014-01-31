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
    flash[:alert] = "#{@group.name} deleted"
    redirect_to groups_path
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.users
    @membership = Membership.new
    @event = Event.new
    @events = @group.events.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    @group.creator = current_user
    if @group.save
      flash[:success] = "Group successfully created"
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