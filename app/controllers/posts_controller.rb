class PostsController < ApplicationController
before_action :set_post, :only => [:edit, :update,:show, :destroy]

  def index
    @posts = Post.all
  end

  def show;end

  def new
    @post = Post.new
  end
  # TODO SEND RSS FEED TO MAILS WHEN A POST IS BEING  -- SHOULD BE APPROVED FOR PUBLISHED
  def create
    @post = Post.new(post_params)
      if @post.save
          redirect_to action: "index"
          flash[:notice] = "#{@post.title.upcase }  WAS CREATED SUCCESSFULLY"
      else
         render :new
      end
  end

  def edit
  end

  def update
    if @post.update(post_params)
        redirect_to action: "index"
        flash[:notice] = "#{@post.title.upcase } HAS BEEN UPDATED SUCCESSFULLY"
    else
        flash[:notice] = "Post was not updated"
        render :edit
    end
  end

  def destroy
    if @post.destroy
        flash[:notice] = "#{@post.title} was deleted suc"
        redirect_to posts_path
    else
        flash[:notice] = "Post was not deleted"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
