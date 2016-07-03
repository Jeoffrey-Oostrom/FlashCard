class VisitorsController < ApplicationController
  before_action :if_admin
  skip_before_action :check_login, :if_admin, only: [:new, :create, :overview]

  def index
    @visitors = Visitor.all
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)
    if @visitor.save
      session[:visitor_id] = @visitor.id
      redirect_to :visitors
    else
      render 'new'
    end
  end

  def edit
    @visitor = Visitor.find(params[:id])
  end

  def update
    @visitor = Visitor.find(params[:id])

    if @visitor.update(visitor_params)
      redirect_to :visitors
    else
      render :edit
    end
  end

  def destroy
    visitor = Visitor.find(params[:id])
    visitor.destroy
    redirect_to :visitors
  end

  private

  def visitor_params
    params.require(:visitor).permit(:name, :username, :password, :admin)
  end
end
