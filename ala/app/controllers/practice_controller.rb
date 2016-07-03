class PracticeController < ApplicationController
  def new
    subject = params[:subject]
    @questions = Question.all.where("`questions`.`subject_id` = #{subject}")
    @practice = Practice.new
    @i = 0
  end

  def create

  end
end
