class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_login
  helper_method :current_user, :if_admin, :check_login

  def logout
    @_current_user = session[:current_user_id] = nil
    redirect_to :root
  end

  def check_login
    if current_user == nil
      redirect_to :root, notice: 'you need to be logged in!'
    end
  end

  private

  def current_user
    @current_user ||= Visitor.find(session[:visitor_id]) if session[:visitor_id]
  end

  def if_admin
    visitor = Visitor.find(session[:visitor_id])
    if !visitor.admin
      redirect_to overview_path
    end
  end
end
