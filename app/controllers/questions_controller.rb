class QuestionsController < ApplicationController
  before_filter :login_required

  def new
  end

  def create
    # question = Question.create(params[:question])
    question = current_user.questions.create(params[:question])

    p '-----------------'
    p params[:question]
    p '--------------'

    if is_from_android?
      return render :json => {:question_id => question.id} if question
      return render :nothing => true, :status => 404
    else
      return render :text => session[:user_id]
    end
  end
end
