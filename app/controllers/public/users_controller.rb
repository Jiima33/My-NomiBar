class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end 
  end 
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "情報を変更しました"
    else
      render :edit
    end
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @posts = Post.find(favorites)
    @posts = Kaminari.paginate_array(@posts).page(params[:page])
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :is_stopped, :gender)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end
end
