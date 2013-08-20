class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  layout "home"
  
  def index
    if current_user.admin?
      @users = User.all
    else
      @users = User.where("id = #{current_user.id}")
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end    
  end

  def show
    @user = User.find(params[:id])
    puts @user.inspect
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
