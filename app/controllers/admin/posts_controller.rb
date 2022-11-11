class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  def index
   @posts = Post.page(params[:page]).per(10)
  end
  
  def show
    @post = Post.find(params[:id])
  end 
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end
  
end

