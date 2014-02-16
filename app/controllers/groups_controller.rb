class GroupsController < ApplicationController

  before_filter :authenticate_user!
  before_action :your_groups

  def index
    if current_user.groups.include?(params[:id])
      @your_groups = current_user.groups
    else
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    if @group.save
      flash[:success] = "Group updated"
      redirect_to group_path(@group)
    else
      redirect_to group_path(@group)
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:alert] = "#{@group.name} deleted"
    redirect_to groups_path
  end

  def show
    if current_user.groups.exists?(params[:id])
      @nag = Nag.new
      @comment = Comment.new
      @your_groups = current_user.groups.order(created_at: :desc)
      @group = Group.find(params[:id])
      @members = @group.users
      @membership = Membership.new
      @event = Event.new
      @events = @group.events.order(created_at: :desc)
    else
      flash[:warning] = "Not a valid path"
      redirect_to root_path
    end
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
      flash[:alert] = "Unable to create group!"
      redirect_to root_path
    end
  end

  private

  def your_groups
    @your_groups = current_user.groups
  end

  def group_params
    params.require(:group).permit(:name, :creator)
  end

end