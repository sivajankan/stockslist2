class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  layout "home"
  
  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.where("id = #{current_user.id}")
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
