class QuestionsController < ApplicationController
  before_action :if_admin
  def index
    @questions = Question.all
  end

  def new
    @subjects = Subject.all
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    if question.save
      redirect_to :questions
    else
      render 'new'
    end
  end

  def edit
    @subjects = Subject.all
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(question_params)
      redirect_to :questions
    else
      render 'edit'
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to :questions
  end

  private

  def question_params
    params.require(:question).permit(:question, :answer, :subject_id, :open)
  end
end
