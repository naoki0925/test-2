class HomesController < ApplicationController

  def about
  end
  
  def unsubscribe
    @user = User.find(params[:id])
  end
  
  def withdraw
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

end
