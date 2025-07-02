class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to life_booking_path(@life, @booking)
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :encrypted_password)
  end

end
