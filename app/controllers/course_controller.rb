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

	def beg_branch_security
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Bezpieczeństwo").limit(5)

		render "course/course_beg/branch_1_security"
	end

	def beg_branch_abc_sample
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "ABC, Wywiad środowiskowy").limit(5)

		render "course/course_beg/branch_2_abc_sample"
	end

	def beg_branch_bleeding
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Krwotoki").limit(5)

		render "course/course_beg/branch_3_bleeding"
	end

	def beg_branch_consciousness
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Omdlenia i utraty przytomności").limit(5)

		render "course/course_beg/branch_4_consciousness"
	end

	def beg_branch_scald_frostbite
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Oparzenia, odmrożenia").limit(5)

		render "course/course_beg/branch_5_scald_frostbite"
	end

	def beg_branch_hypothermia_hyperthermia
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Hipotermia, hipertermia").limit(5)

		render "course/course_beg/branch_6_hypothermia_hyperthermia"
	end

	def beg_branch_mech_injury
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Urazy mechaniczne").limit(5)

		render "course/course_beg/branch_7_mech_injury"
	end

	def beg_branch_epilepsy
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Epilepsja").limit(5)

		render "course/course_beg/branch_8_epilepsy"
	end

	def beg_branch_chocking
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "Zadławienia").limit(5)

		render "course/course_beg/branch_9_chocking"
	end

	def beg_branch_CPR
		@questions = Question.order("RAND()").where(level: "Poczatkujacy", branch: "RKO").limit(5)

		render "course/course_beg/branch_10_CPR"
	end


	def adv_branch_heart_attack
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Zawały").limit(5)

		render "course/course_adv/branch_1_heart_attack"
	end

	def adv_branch_poisoning
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Zatrucia").limit(5)

		render "course/course_adv/branch_2_poisoning"
	end

	def adv_branch_foreign_body
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Ciało obce w ciele").limit(5)

		render "course/course_adv/branch_3_foreign_body"
	end

	def adv_branch_AED
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "AED").limit(5)

		render "course/course_adv/branch_4_AED"
	end

	def adv_branch_electrocution
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Porażenia prądem").limit(5)

		render "course/course_adv/branch_5_electrocution"
	end

	def adv_branch_blood_pressure_pulse
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Ciśnienie i tętno").limit(5)

		render "course/course_adv/branch_6_blood_pressure_pulse"
	end

	def adv_branch_stroke
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Udary").limit(5)

		render "course/course_adv/branch_7_stroke"
	end

	def adv_branch_diabetes
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Cukrzyca").limit(5)

		render "course/course_adv/branch_8_diabetes"
	end

	def adv_branch_pneumothorax
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Odma płucna").limit(5)

		render "course/course_adv/branch_9_pneumothorax"
	end

	def adv_branch_heart_shock
		@questions = Question.order("RAND()").where(level: "Zaawansowany", branch: "Wstrząsy").limit(5)

		render "course/course_adv/branch_10_shock"
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
					if @user_progress.p1
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p1: true)
					end
				elsif @current_question.branch == "ABC, Wywiad środowiskowy"
					if @user_progress.p2
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p2: true)
					end
				elsif @current_question.branch == "Krwotoki"
					if @user_progress.p3
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p3: true)
					end
				elsif @current_question.branch == "Omdlenia i utraty przytomności"
					if @user_progress.p4
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p4: true)
					end
				elsif @current_question.branch == "Oparzenia, odmrożenia"
					if @user_progress.p5
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p5: true)
					end
				elsif @current_question.branch == "Hipotermia, hipertermia"
					if @user_progress.p6
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p6: true)
					end
				elsif @current_question.branch == "Urazy mechaniczne"
					if @user_progress.p7
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p7: true)
					end
				elsif @current_question.branch == "Epilepsja"
					if @user_progress.p8
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p8: true)
					end

				elsif @current_question.branch == "Zadławienia"
					if @user_progress.p9
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p9: true)
					end
				elsif @current_question.branch == "RKO"
					if @user_progress.p10
						current_user.increment!(:points, 2)
					else
						current_user.increment!(:points, 10)
						@user_progress.update(p20: true)
					end
				end
				
				redirect_to beg_course_index_path, :notice => "Brawo, zdałeś pytania z działu #{@current_question.branch}"
			
			elsif @current_question.level == "Zaawansowany"
				if @current_question.branch == "Zawały"
					if @user_progress.z1
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z1: true)
					end
				elsif @current_question.branch == "Zatrucia"
					if @user_progress.z2
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z2: true)
					end
				elsif @current_question.branch == "Ciało obce w ciele"
					if @user_progress.z3
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z3: true)
					end
				elsif @current_question.branch == "AED"
					if @user_progress.z4
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z4: true)
					end
				elsif @current_question.branch == "Porażenia prądem"
					if @user_progress.z5
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z5: true)
					end
				elsif @current_question.branch == "Ciśnienie i tętno"
					if @user_progress.z6
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z6: true)
					end
				elsif @current_question.branch == "Udary"
					if @user_progress.z7
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z7: true)
					end
				elsif @current_question.branch == "Cukrzyca"
					if @user_progress.z8
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z8: true)
					end
				elsif @current_question.branch == "Odma płucna"
					if @user_progress.z9
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z9: true)
					end
				elsif @current_question.branch == "Wstrząsy"
					if @user_progress.z10
						current_user.increment!(:points, 5)
					else
						current_user.increment!(:points, 20)
						@user_progress.update(z10: true)
					end
				end

				redirect_to adv_course_index_path, :notice => "Brawo, zdałeś wszystkie pytania z działu #{@current_question.branch}"
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