class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
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
  
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :email, :is_stopped)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "ゲストユーザー"
      redirect_to user_path(current_user), notice: "ゲストユーザーはプロフィール編集画面へ遷移できません"
    end
  end
end
