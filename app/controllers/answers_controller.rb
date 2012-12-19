class AnswersController < ApplicationController
  #before_filter :login_required
  before_filter :pre_load
  
  def pre_load
    @answer = Answer.find(params[:id]) if params[:id]
    @question = Question.find(params[:question_id]) if params[:question_id]
  end

  def index
    @answers = Answer.all

    respond_to do |format|
      format.html {render :nothing => true, :status => 404}
      if !@answers.nil?
        @answers = @answers.map { |q| q.hash_in_android }
        format.json {render :json => @answers}
      end
    end
  end

  def new
  end

  def create
    params[:answer][:creator_id] = current_user.id
    @answer = @question.answers.create(params[:answer])

    p '-----------------'
    p params[:answer]
    p '--------------'

    respond_to do |format|
      format.html {render :nothing => true, :status => 404}
      format.json {render :json => @answer.hash_in_android} if @answer
    end
  end
end
