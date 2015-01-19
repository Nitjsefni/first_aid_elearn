class ExamAnswersController < ApplicationController
  before_filter :authenticate_user!

  before_filter(only: [:show]) { auth_correct_user(params[:id]) } 

def auth_correct_user(id)
	@exam_answer =  ExamAnswer.find(id)
	unless current_user && current_user.id == @exam_answer.user_id
		flash[:notice] = 'Nie masz dostępu do wyników tego egzaminu.'
	    redirect_to exam_list_path 
	end
end

def show
  	

	@exam_answer = ExamAnswer.find(params[:id])
	@exam = Exam.find(@exam_answer.exam_id)
	@user = User.find(@exam_answer.user_id)
	@questions = Question.all.where(level: @exam.level)
	@exams_questions = @questions.all.where(id: [@exam.question1, @exam.question2, @exam.question3, @exam.question4, @exam.question5, @exam.question6, @exam.question7, @exam.question8, @exam.question9, @exam.question10])
    
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
	@questions = Question.all.where(level: @exam.level)
	@exams_questions = @questions.all.where(id: [@exam.question1, @exam.question2, @exam.question3, @exam.question4, @exam.question5, @exam.question6, @exam.question7, @exam.question8, @exam.question9, @exam.question10])
	@exam_answer.user_id = current_user.id
	@exam_answer.ans1 = params[:q1]
	@exam_answer.q1 = (@exam_answer.ans1 == @exams_questions[0].answerR ? true : false)
	@exam_answer.ans2 = params[:q2]
	@exam_answer.q2 = (@exam_answer.ans2 == @exams_questions[1].answerR ? true : false)
	@exam_answer.ans3 = params[:q3]
	@exam_answer.q3 = (@exam_answer.ans3 == @exams_questions[2].answerR ? true : false)
	@exam_answer.ans4 = params[:q4]
	@exam_answer.q4 = (@exam_answer.ans4 == @exams_questions[3].answerR ? true : false)
	@exam_answer.ans5 = params[:q5]
	@exam_answer.q5 = (@exam_answer.ans5 == @exams_questions[4].answerR ? true : false)
	@exam_answer.ans6 = params[:q6]
	@exam_answer.q6 = (@exam_answer.ans6 == @exams_questions[5].answerR ? true : false)
	@exam_answer.ans7 = params[:q7]
	@exam_answer.q7 = (@exam_answer.ans7 == @exams_questions[6].answerR ? true : false)
	@exam_answer.ans8 = params[:q8]
	@exam_answer.q8 = (@exam_answer.ans8 == @exams_questions[7].answerR ? true : false)
	@exam_answer.ans9 = params[:q9]
	@exam_answer.q9 = (@exam_answer.ans9 == @exams_questions[8].answerR ? true : false)
	@exam_answer.ans10 = params[:q10]
	@exam_answer.q10 = (@exam_answer.ans10 == @exams_questions[9].answerR ? true : false)
	
	rec_point = (@exam_answer.q1 ? 1:0) + (@exam_answer.q2 ? 1:0) + (@exam_answer.q3 ? 1:0) + (@exam_answer.q4 ? 1:0) + (@exam_answer.q5 ? 1:0) + (@exam_answer.q6 ? 1:0) + (@exam_answer.q7 ? 1:0) + (@exam_answer.q8 ? 1:0) + (@exam_answer.q9 ? 1:0) + (@exam_answer.q10 ? 1:0)
	points = rec_point/10.to_f
	points2 = points*@exam.points.to_i
	@exam_answer.rec_points = points2

	temp = 7/10.to_f
	@min = temp*@exam.points.to_i

	if @exam_answer.rec_points >= @min
		@user_progress = UserProgress.find_by user_id: current_user.id
		if @exam.level == "Początkujący" && @user_progress.poczatkujacy?
			@user_progress.update(poczatkujacy: true)
		elsif @exam.level == "Zaawansowany" && @user_progress.zaawansowany?
			@user_progress.update(complete_all: true)
			@user_progress.update(zaawansowany: true)
		end
		current_user.increment!(:points, points2)
		respond_to do |format|
		  if @exam_answer.save
		    format.html { redirect_to @exam_answer, :notice => "Zdales egzamin!." }
		    format.json { render :show, status: :created, location: @exam_answer }
		  else
		    format.html { render :new }
		    format.json { render json: @exam_answer.errors, status: :unprocessable_entity }
		  end
		end
		
	else
		respond_to do |format|
			format.html { redirect_to exam_list_path , :notice => "Nie zdales egzaminu, zdobyles za malo punktow, liczba otrzymanych punktow - #{@exam_answer.rec_points} , minimum do zdania - #{@min}" }
		    format.json { render exam_list_path, status: :unprocessable_entity , location: exam_list }
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



