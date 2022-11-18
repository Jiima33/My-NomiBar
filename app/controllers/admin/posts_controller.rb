# frozen_string_literal: true

class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.page(params[:page])
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_posts_path, notice: "投稿を削除しました"
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result
  end

  private
    def search_params
      params.require(:q).permit()
    end
end
