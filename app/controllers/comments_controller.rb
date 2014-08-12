class CommentsController < ApplicationController

  before_filter :commentable

  def create
      @comment = commentable.comments.new(comment_params)
      @comment.user = current_user

      respond_to do |format|
        if @comment.save
          format.json { render json: @comment.to_json(include: :user) }
        else
          format.json { render json: @comment.errors }
        end
      end
  end

  def destroy
    comment = Comment.find(params[:id])
    respond_to do |format|
      if comment.destroy
        format.json { render json: comment }
      else
        format.json { redner json: comment.errors }
      end
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