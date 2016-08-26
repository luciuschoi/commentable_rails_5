class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [ :edit, :destroy, :update ]

  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.save
  end

  def edit

  end

  def update
    @comment.update_attributes(comment_params)

  end

  def destroy
    @comment.destroy
  end

  private

  def set_commentable
    commentable_type, commentable_id = request.path.split('/')[1,2]
    @commentable = commentable_type.singularize.classify.constantize.find(commentable_id)
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit( :content )
  end

end
