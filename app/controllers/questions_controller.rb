class QuestionsController < ApplicationController
  layout :false

  def create
    Question.create(params[:question])

    p '-----------------'
    p params[:question]
    p '--------------'

    render :json => {}
  end
end
