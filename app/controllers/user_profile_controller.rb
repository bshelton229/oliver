class UserProfileController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        sign_in @user, bypass: true
        format.html { redirect_to root_path }
      else
        format.html { render 'edit' }
      end
    end
  end

  private
    def user_params
      p = params.require(:user).permit(:email,:name,:password)
      p[:password] = nil if p[:password].blank?
      p
    end
end
