class CommentsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  load_resource :document

  def create
    @comment = @document.comments.new comment_params
    @comment.user = current_user
    if @comment.save!
      respond_to do |format|
        format.html{redirect_to @document}
        format.js
      end
    end
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment
      if @comment.destroy
        respond_to do |format|
          format.js
          format.html{redirect_to @document}
        end
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit :content
  end
end
