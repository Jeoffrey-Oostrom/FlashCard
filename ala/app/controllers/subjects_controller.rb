class SubjectsController < ApplicationController
  before_action :if_admin
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    subject = Subject.new(subject_params)
    if subject.save
      redirect_to :subjects
    else
      render 'new'
    end
  end

  def update
    @subject = Subject.find(params[:id])
  end

  def edit
    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      redirect_to :subjects
    else
      render :edit
    end
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    redirect_to :subjects
  end

  private

  def subject_params
    params.require(:subject).permit(:subject)
  end
end
