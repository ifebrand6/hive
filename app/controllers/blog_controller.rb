class BlogController < ApplicationController

  def index
    @posts = Post.recent
  end

  def single_post
    @post = Post.find(params[:id])
    @comment = Comment.new
  end
end
