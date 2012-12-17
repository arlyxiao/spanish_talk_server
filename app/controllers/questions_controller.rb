class QuestionsController < ApplicationController
  #before_filter :login_required
  before_filter :pre_load
  
  def pre_load
    @question = Question.find(params[:id]) if params[:id]
  end

  def index
    @questions = Question.all

    if is_from_android?
      return render :json =>  @questions if @questions.any?
      return render :nothing => true, :status => 404
    end
  end

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

  def show
    if is_from_android?
      return render :json => {:title => @question.title, :content => @question.content} if @question
      return render :nothing => true, :status => 404
    end
  end
end
