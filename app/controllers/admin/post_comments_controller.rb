class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    #@post_comments = PostComment.page(params[:page])
    @q = PostComment.ransack(params[:q])
    @post_comments = @q.result.page(params[:page])
  end 
  
  def destroy
    @post_comment = PostComment.find(params[:id])
    @post_comment.destroy
    redirect_to request.referer, alert: "コメントを削除しました"
  end
  
  def search
    @q = PostComment.search(search_params)
    @post_comments = @q.result
  end 
  
  private
  def search_params
    params.require(:q).permit()
  end
end

