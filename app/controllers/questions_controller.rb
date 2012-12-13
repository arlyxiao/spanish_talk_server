class QuestionsController < ApplicationController
  layout :false

  def create
    question = Question.create(params[:question])

    p '-----------------'
    p params[:question]
    p '--------------'

    render :json => {:question_id => question.id}
  end
end
