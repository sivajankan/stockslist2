class SessionsController < ApplicationController
  def create
    #debugger
    render :text => request.env['omniauth.auth'].inspect
  end
  
end
