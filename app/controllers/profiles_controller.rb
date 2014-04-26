class ProfilesController < ApplicationController

  skip_before_action :your_groups, :valid_request, only: [:show]
  before_action :your_groups
  before_filter :authenticate_user!


  def show
    @user = User.find(params[:id])
  end

  def index
    criteria = params[:search]
    @users = find_users(criteria)
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

  def find_users(criteria)
    User.where("first_name = ? OR last_name = ?", criteria, criteria)
  end

  def your_groups
    @your_groups = current_user.groups
  end

end