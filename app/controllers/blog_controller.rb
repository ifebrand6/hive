class BlogController < ApplicationController
  layout "home"

  def index
    @posts = Post.recent
  end

  def single_post
    @post = Post.friendly.find(params[:id])
    @comment = Comment.new
    @posts = Post.recent

  end
end
