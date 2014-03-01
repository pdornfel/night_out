class ProfilesController < ApplicationController

  before_action :your_groups, :valid_request
  before_filter :authenticate_user!


  def show
    @user = User.find(params[:id])
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

end