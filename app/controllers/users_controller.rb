class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  
  def show # 追加
      @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
            flash[:success] = "Welcome to the Sample App!"
        redirect_to @user # ここを修正
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Successfully updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:area,:profile)
  end
  
  def set_user
   @user = User.find(params[:id])
  end
  
end