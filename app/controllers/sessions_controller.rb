class SessionsController < ApplicationController
  def create
    #debugger
    #render :text => request.env['omniauth.auth'].inspect
    user = request.env['omniauth.auth']
    unless @user = User.auth_find_from_hash(user)
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      debugger
      @user = User.auth_create_from_hash(user, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @user
    

    #render :text => "Welcome, #{current_user.name}."
    flash[:notice] = "Welcome, #{current_user.name}."
    redirect_to root_path
  end
  
  def destroy
    #@authentication = current_user.authentications.find(params[:id])
    #@authentication.destroy
    @user.provider = ''
    @user.save
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end

  
end
