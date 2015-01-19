class CourseController < ApplicationController
before_filter :authenticate_user!
before_filter(only: [:adv_index]) { auth_adv_user() } 

def auth_adv_user()
	user_progress = UserProgress.select("poczatkujacy").where(user_id: current_user.id).take
	unless current_user && user_progress.poczatkujacy
		flash[:notice] = 'Nie masz dostępu do poziomu zaawansowanego.'
	    redirect_to root_path 
	end
end
	def index

	end

	def beg_index
		@user_progress = UserProgress.select("p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9", "p10").where(user_id: current_user.id).take
		@user_progress_all = UserProgress.where(user_id: current_user.id).take
		@user_branches_access = [@user_progress.p1, @user_progress.p2, @user_progress.p3, @user_progress.p4, @user_progress.p5, @user_progress.p6, @user_progress.p7, @user_progress.p8, @user_progress.p9, @user_progress.p10]
		branches = Question::CATEGORIES_BEG.map {|row| [ row[0]] }
		@branch = branches.map {|p| p[0]} 
		@exam = Exam.order("RAND()").where(level: "Początkujący").first
	end

	def adv_index
		@user_progress = UserProgress.select("z1", "z2", "z3", "z4", "z5", "z6", "z7", "z8", "z9", "z10").where(user_id: current_user.id).take
		@user_progress_all = UserProgress.where(user_id: current_user.id).take
		@user_branches_access = [@user_progress.z1, @user_progress.z2, @user_progress.z3, @user_progress.z4, @user_progress.z5, @user_progress.z6, @user_progress.z7, @user_progress.z8, @user_progress.z9, @user_progress.z10]
		branches = Question::CATEGORIES_ADV.map {|row| [ row[0]] }
		@branch = branches.map {|p| p[0]} 
		@exam = Exam.order("RAND()").where(level: "Zaawansowany").first
	end

	def branch_security
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Bezpieczeństwo").limit(5)
		@exam_answer = ExamAnswer.new
		render "course/course_beg/branch_security"

		
	end

	def check_answers
		
		@user_progress = UserProgress.find_by user_id: current_user.id

		q1_id = params[:q1_id]
		@current_question = Question.find(q1_id)
		ans1 = params[:q1]
		q1 = (ans1 == @current_question.answerR ? true : false)
		
		q2_id = params[:q2_id]
		@current_question = Question.find(q2_id)
		ans2 = params[:q2]
		q2 = (ans2 == @current_question.answerR ? true : false)
		
		q3_id = params[:q3_id]
		@current_question = Question.find(q3_id)
		ans3 = params[:q3]
		q3 = (ans3 == @current_question.answerR ? true : false)
		
		q4_id = params[:q4_id]
		@current_question = Question.find(q4_id)
		ans4 = params[:q4]
		q4 = (ans4 == @current_question.answerR ? true : false)
		
		q5_id = params[:q5_id]
		@current_question = Question.find(q5_id)
		ans5 = params[:q5]
		q5 = (ans5 == @current_question.answerR ? true : false)

		points = (q1 ? 1:0) + (q2 ? 1:0) + (q3 ? 1:0) + (q4 ? 1:0) + (q5 ? 1:0)
		if q1 && q2 && q3 && q4 && q5 
			if @current_question.level == "Początkujący"
				if @current_question.branch == "Bezpieczeństwo"
					@user_progress.update(p1: true)
				elsif @current_question.branch == "ABC, Wywiad środowiskowy"
					@user_progress.update(p2: true)
				elsif @current_question.branch == "Krwotoki"
					@user_progress.update(p3: true)
				elsif @current_question.branch == "Omdlenia i utraty przytomności"
					@user_progress.update(p4: true)
				elsif @current_question.branch == "Oparzenia, odmrożenia"
					@user_progress.update(p5: true)
				elsif @current_question.branch == "Hipotermia, hipertermia"
					@user_progress.update(p6: true)
				elsif @current_question.branch == "Urazy mechaniczne"
					@user_progress.update(p7: true)
				elsif @current_question.branch == "Epilepsja"
					@user_progress.update(p8: true)
				elsif @current_question.branch == "Zadławienia"
					@user_progress.update(p9: true)
				elsif @current_question.branch == "RKO"
					@user_progress.update(p10: true)
				end
				current_user.increment!(:points, 5)
				redirect_to beg_course_index_path, :notice => "Brawo, zdałeś pytania z działu #{@current_question.branch}"
			
			elsif @current_question.level == "Zaawansowany"
				if @current_question.branch == "Zawały"
					@user_progress.update(z1: true)
				elsif @current_question.branch == "Zatrucia"
					@user_progress.update(z2: true)
				elsif @current_question.branch == "Ciało obce w ciele"
					@user_progress.update(z3: true)
				elsif @current_question.branch == "AED"
					@user_progress.update(z4: true)
				elsif @current_question.branch == "Porażenia prądem"
					@user_progress.update(z5: true)
				elsif @current_question.branch == "Ciśnienie i tętno"
					@user_progress.update(z6: true)
				elsif @current_question.branch == "Udary"
					@user_progress.update(z7: true)
				elsif @current_question.branch == "Cukrzyca"
					@user_progress.update(z8: true)
				elsif @current_question.branch == "Odma płucna"
					@user_progress.update(z9: true)
				elsif @current_question.branch == "Wstrząsy"
					@user_progress.update(z10: true)
				end
				current_user.increment!(:points, 10)
				redirect_to adv_course_index_path, :notice => "Brawo, zdałeś pytania z działu #{@current_question.branch}"
			end
		else
			if @current_question.level == "Początkujący"

				redirect_to beg_course_index_path, :notice => "Nie zdałeś pytania z działu #{@current_question.branch}, odpowiedziałeś poprawnie na #{@points} z 5 pytań, spróbuj jeszcze raz"
			elsif @current_question.level == "Zaawansowany"
				
				redirect_to adv_course_index_path, :notice => "Nie zdałeś pytania z działu #{@current_question.branch}, odpowiedziałeś poprawnie na #{@points} z 5 pytań, spróbuj jeszcze raz"
			end
		end
			
	end

end