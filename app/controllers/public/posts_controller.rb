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
    @q = Post.ransack(params[:q])
    @posts = @q.result.includes(:area, :tags).page(params[:page])
    @areas = Area.all
    @tags = Tag.all
  end 
  
  def show 
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end 
  
  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to post_path(post), notice: "投稿内容を変更しました"
    else
      render :edit
    end
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, alert: "投稿を削除しました"
  end
  
  def search
    @q = Post.search(search_params)
    @posts = @q.result.includes(:area, :tags)
  end 
  
  private
  def post_params
    params.require(:post).permit(:title, :body, :rate, :area_id, tag_ids: [] )
  end
  
  def search_params
    params.require(:q).permit(:area_id_eq)
  end
end
