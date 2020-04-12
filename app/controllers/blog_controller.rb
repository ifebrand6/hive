class BlogController < ApplicationController

  def index
    @posts = Post.recent
  end

  def single_post
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
  
  def add_comment
    @comment = Comment.new(comment_params)
      if @comment.save
        redirect_to single_post_path(@comment.post.id )
      else 
        render :single_post
      end
  end

private

  def comment_params
    params.require(:comment).permit(:name, :email, :body, :post_id)
  end
  
end
