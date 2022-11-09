class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post = Post.new
  end 
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post), notice: "投稿しました"
    else
      render :new
    end 
  end 
  
  def index
    @posts = Post.all
  end 
  
  def show 
    @post = Post.new
  end 
  
  def edit
  end 
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post), notice: "投稿内容を変更しました"
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました"
  end 
  
  private
    def post_params
      params.require(:post).permit(:title, :body, :rate, :area_id, tag_ids: [])
    end
end