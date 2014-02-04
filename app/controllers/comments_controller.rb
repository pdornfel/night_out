class CommentsController < ApplicationController

  def create
    event = Event.find(params[:event_id])
    user = current_user
    body = params[:comment][:body]
    comment = Comment.new
    comment.user = user
    comment.body = body
    comment.event = event
    if comment.save
      flash[:success] = "Nice comment!"
      redirect_to event_path(event)
    else
      flash[:alert] = "Unable to save comment"
      redirect_to event_path(event)
    end
  end


end