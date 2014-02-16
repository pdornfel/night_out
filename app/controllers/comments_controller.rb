class CommentsController < ApplicationController

  before_filter :commentable

  def create
      comment = commentable.comments.new(comment_params)
      comment.user = current_user
        if comment.save
            if resource == 'Event'
              event = Event.find(params[:event_id])
              flash[:success] = "Nice comment!"
              redirect_to event_path(event)
            elsif resource == 'Group'
              group = Group.find(params[:group_id])
              flash[:success] = "Nice comment!"
              redirect_to group_path(group)
            end
        else
          flash[:alert] = "Unable to save comment"
          redirect_to :back
        end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      if resource == "Event"
          event = Event.find(params[:event_id])
          flash[:success] = "Comment destroyed"
          redirect_to event_path(event)
        elsif resource == "Group"
          group = Group.find(params[:group_id])
          flash[:success] = "Comment destroyed"
          redirect_to group_path(group)
      end
    else
      flash[:alert] = "Unable to delete comment"
      redirect_to :back
    end
  end

  def resource
    request.path.split('/')[1].singularize.classify
  end

  private

  def commentable
    resource, id = request.path.split('/')[1, 2]
    resource.singularize.classify.constantize.find(id)
  end

  def comment_params
    params.require(:comment).permit(:body, :event_id)
  end


end