class CommentsController < ApplicationController
  before_action :set_comment, only: [:show]

  def show
  end

  def create
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to single_post_path(@comment.post.id ), notice: 'Thanks for your comment.' 
      else 
        flash[:notice] = 'failed to comment!'
      end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:name, :email, :body, :post_id)
    end
end
