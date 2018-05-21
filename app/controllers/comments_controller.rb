class CommentsController < ApplicationController
  before_action :set_image

  def create
    @comment = @image.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went wrong."
      render root_path
    end
  end

  def destroy
    @comment = @image.comments.find(params[:id])

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_image
    @image = Image.find(params[:image_id])
  end

end
