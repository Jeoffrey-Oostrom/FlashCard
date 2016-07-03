class ExamsController < ApplicationController
  def new
    subject = params[:subject]
    @questions = Question.all.where("`questions`.`subject_id` = #{subject}")
    @exam = Exam.new
  end

  def create
    @score = 0
    questions = Question.all
    i = 1
    questions.each do
      binding.pry
      if !Question.find_by_answer(params[i.to_s]).nil? && Question.find_by_answer(params[i.to_s]).id == i
        @score +=1
      end
      i = i+1
    end
  end
end
