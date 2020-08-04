class UsersController < ApplicationController

  def edit
  end

  def show
    @user = User.find(params[:id])
    @name = current_user.name
    @posts = @user.posts.order("created_at DESC")
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end