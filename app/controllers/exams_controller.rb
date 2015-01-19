class ExamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :auth_admin 
 
  skip_before_filter :auth_admin, :only => [:take_exam, :exam_list, :users_ranking]
  skip_before_filter :authenticate_user!, :only => [:users_ranking]
  before_action :set_exam, only: [:show, :edit, :update, :destroy]

def auth_admin
  unless current_user && current_user.admin?
    flash[:notice] = 'Nie masz dostępu do działów administratora.'
      
    redirect_to root_path 
  end
end

  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all.order("level ASC")
    @question_text = Question.select("text")

  end


  def exam_list
    @exams = Exam.all.order("level ASC")
    @exam_answer = ExamAnswer.select("exam_id").where(user_id: current_user.id).take
    @access_beg = UserProgress.select(:poczatkujacy).where("user_id = ?", current_user.id).take
    @access_adv = UserProgress.select(:zaawansowany).where("user_id = ?", current_user.id).take
    
  
  end
  # GET /exams/1
  # GET /exams/1.json
  def show
  
    @question_text = Question.select("text")

  end

  # GET /exams/new
  def new
    @exam = Exam.new
  end

  # GET /exams/1/edit
  def edit
  end

  def users_ranking
    @users = User.all.select("id", "name" , "points").order("points DESC")
    @users_progress = UserProgress.select("poczatkujacy", "zaawansowany", "complete_all")

  end

  # POST /exams
  # POST /exams.json
  def create
    @exam = Exam.new(exam_params)

    respond_to do |format|
      if @exam.save
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:id, :title, :text, :level, :question1, :question2, :question3, :question4, :question5, :question6, :question7, :question8, :question9, :question10, :points)
    end
end
