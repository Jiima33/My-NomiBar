class Public::AreasController < ApplicationController
  def show
    @areas = Area.all
    @area = Area.find(params[:id])
    @posts = Post.where(area_id: @area.id).page(params[:page])
  end 
end
