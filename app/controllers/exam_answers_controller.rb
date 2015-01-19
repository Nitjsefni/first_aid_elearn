class ExamAnswersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :auth_admin 
def auth_admin
    redirect_to root_path unless current_user && current_user.admin?
end


def show
  
    
end

# GET /exams/new
def new
	@exam = Exam.find(params[:exam_id])

	@exam_answer = ExamAnswer.new
	@questions = Question.all.where(level: @exam.level)
	@exams_questions = @questions.all.where(id: [@exam.question1, @exam.question2, @exam.question3, @exam.question4, @exam.question5, @exam.question6, @exam.question7, @exam.question8, @exam.question9, @exam.question10])
	
end

# GET /exams/1/edit
def edit
end

# POST /exams
# POST /exams.json
def create
	
	@exam_answer = ExamAnswer.new(exam_answer_params)
	@exam = Exam.find(@exam_answer.exam_id)
	@exam_answer.user_id = current_user.id
	@exam_answer.q1 = params[:q1]
	@exam_answer.q2 = params[:q2]
	@exam_answer.q3 = params[:q3]
	@exam_answer.q4 = params[:q4]
	@exam_answer.q5 = params[:q5]
	@exam_answer.q6 = params[:q6]
	@exam_answer.q7 = params[:q7]
	@exam_answer.q8 = params[:q8]
	@exam_answer.q9 = params[:q9]
	@exam_answer.q10 = params[:q10]
	@rec_point = (@exam_answer.q1 ? 1:0) + (@exam_answer.q2 ? 1:0) + (@exam_answer.q3 ? 1:0) + (@exam_answer.q4 ? 1:0) + (@exam_answer.q5 ? 1:0) + (@exam_answer.q6 ? 1:0) + (@exam_answer.q7 ? 1:0) + (@exam_answer.q8 ? 1:0) + (@exam_answer.q9 ? 1:0) + (@exam_answer.q10 ? 1:0)
	@points = @rec_point/10.to_f
	@points2 = @points*@exam.points.to_i
	@exam_answer.rec_points = @points2

	current_user.increment!(:points, @points2)
	respond_to do |format|
	  if @exam_answer.save
	    format.html { redirect_to @exam_answer, notice: 'Exam was successfully created.' }
	    format.json { render :show, status: :created, location: @exam_answer }
	  else
	    format.html { render :new }
	    format.json { render json: @exam_answer.errors, status: :unprocessable_entity }
	  end
	end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam_answer = ExamAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_answer_params
      params.require(:exam_answer).permit(:id, :exam_id, :user_id, :q1, :q2, :q3, :q4, :q5, :q6, :q7, :q8, :q9, :q10, :rec_points)
    end
end



