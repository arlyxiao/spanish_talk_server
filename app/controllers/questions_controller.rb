class QuestionsController < ApplicationController
  before_filter :login_required
  before_filter :pre_load
  
  def pre_load
    @question = Question.find(params[:id]) if params[:id]
  end

  def index
    @questions = Question.paginate(:page => params[:page], :per_page => 10)
    @total = Question.count

    respond_to do |format|
      format.html {render :nothing => true, :status => 404}
      if !@questions.nil?
        @questions = @questions.map { |q| q.hash_in_android }

        format.json {render :json => {:questions => @questions, :total => @total}}
      end
    end
  end

  def new
  end

  def create
    # question = Question.create(params[:question])
    @question = current_user.questions.create(params[:question])

    p '-----------------'
    p params[:question]
    p '--------------'

    respond_to do |format|
      format.html {render :nothing => true, :status => 404}
      format.json {render :json => {:question_id => @question.id}} if !@question.id.nil?
      format.json {render :nothing => true, :status => 404} if @question.id.nil?
    end
  end

  def show
    respond_to do |format|
      format.html {render :nothing => true, :status => 404}
      format.json {render :json => @question.hash_in_android} if @question
    end

  end

  def my
    @questions = current_user.questions.paginate(:page => params[:page], :per_page => 10)
    @total = current_user.questions.count

    respond_to do |format|
      format.html {render :nothing => true, :status => 404}

      if !@questions.nil?
        @questions = @questions.map { |q| q.hash_in_android }
        format.json {render :json => {:questions => @questions, :total => @total}}
      end
    end

  end
end
