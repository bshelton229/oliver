class UsersController < ApplicationController
  before_filter :check_current, only: [:update, :destroy]

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

  def edit
    @user = User.find params[:id]
    respond_to do |format|
      format.html
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path }
      else
        format.html { render 'edit' }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end

  private
    def user_params
      p = params.require(:user).permit(:email, :password, :password_confirmation, :name)
      # Don't pass the password through if it's blank, to keep it the same
      p[:password] = nil if p[:password].blank?
      p
    end

    def check_current
      @user = User.find params[:id]
      redirect_to users_path if @user == current_user
    end
end
