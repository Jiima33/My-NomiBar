class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @posts = Post.page(params[:page])
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end
  
end

