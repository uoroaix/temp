class QuestionsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :find_question, only: [:edit, :destroy, :update, :vote_up, :vote_down]
	# before_action :find_question, except: [:index, :new, :create]

	def index
		@recent_questions = Question.recent(3)
		@questions = Question.limit(10)
	end



	def create
		@question = Question.new(question_attributes)
		@question.user = current_user

		if @question.save
			expire_fragment "recent_questions"
			# flash[:notice] = "Your question was created successfully!"
			redirect_to questions_path, notice: "Your question was created!"
		else
			render :new
		end
	end


	def show
		@question = Question.find(params[:id])
		@answer = Answer.new
		if user_signed_in?
			@favorite = current_user.favorite_for(@question)
			# @vote = current_user.vote_for(@vote)
			@vote = user_signed_in? ? (current_user.vote_for(@question) || Vote.new) : Vote.new
		end
		@answers = @question.answers.ordered_by_creation
	end

	def new
		@question = Question.new

	end

	def edit
		# redirect_to root_path, alert: "Access Denied" unless can? :edit, @question
	end

	def update

		if @question.update_attributes(question_attributes)
			expire_fragment "recent_questions"
			redirect_to @question, notice: "Question updated successfully!"
		else
			flash.now[:error] = "Couldn't update!"
			render :edit
		end

		
	end

	def destroy

		if @question.destroy
			redirect_to questions_path, notice: "Question deleted!"
		else
			redirect_to questions_path, error: "We have trouble deleting it!"
		end

	end



	# def search
	# end



	private

	def question_attributes
		params.require(:question).permit([:title, :description, {category_ids: []}, :image])
	end

	def find_question
		@question = current_user.questions.find(params[:id])
		redirect_to root_path, alert: "Access Denied" unless @question
		# @question = current_user.questions.find_by_id(params[:id])
		#@question will be nil if there isn't a id like that
	end

end
