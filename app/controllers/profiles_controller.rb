class ProfilesController < ApplicationController

  skip_before_action :your_groups, :valid_request, only: [:show]
  before_filter :authenticate_user!


  def show
    @user = User.find(params[:id])
  end

  def index
    @users = find_users
    if @users
      redirect_to profiles_path
    else
      flash[:secondary] = "Feature Coming Soon"
      redirect_to root_path
    end
  end

  private

  def your_groups
    @your_groups = current_user.groups
  end

  def valid_request
    unless current_user.id == params[:id].to_i
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  def find_users
  end

end