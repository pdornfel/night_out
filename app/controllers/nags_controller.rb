class NagsController < ApplicationController

  def create
    group = Group.find(params[:group_id])
    nag = Nag.new(nag_params)
    nag.group = group
    nag.user = current_user
    if nag.save
      Mailer.send_nag(nag).deliver
      flash[:success] = "You nagged the group"
      redirect_to group_path(group)
    else
      flash[:alert] = "Nag fail"
      redirect_to group_path(group)
    end
  end

  private

  def nag_params
    params.require(:nag).permit(:body)
  end

end