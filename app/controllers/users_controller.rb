class UsersController < ApplicationController
  before_action :set_user,only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:image, :nickname, :self_introduction, :country_id, :gender_id, :age, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end
end

