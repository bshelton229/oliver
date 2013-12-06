class UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.html
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path }
      else
        format.html { render 'new' }
      end
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy if @user != current_user
    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
