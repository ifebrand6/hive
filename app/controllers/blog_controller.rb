class BlogController < ApplicationController
  def index
    @posts = Post.recent
  end
end
