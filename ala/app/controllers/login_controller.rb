class LoginController < ApplicationController
  skip_before_action :check_login

  def new
  end

  def create
    visitor = Visitor.authenticate(params[:username], params[:password])
    if visitor
      session[:visitor_id] = visitor.id
      redirect_to visitors_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:visitor_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end


end
