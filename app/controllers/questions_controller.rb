class QuestionsController < ApplicationController

	before_action :find_question, only: [:show, :edit, :destroy, :update, :vote_up, :vote_down]
	# before_action :find_question, except: [:index, :new, :create]

	def index
		@questions = Question.all
	end

	def create
		@question = Question.new(question_attributes)

		if @question.save
			# flash[:notice] = "Your question was created successfully!"
			redirect_to questions_path, notice: "Your question was created!"
		else
			render :new
		end
	end



	def show
	end

	def new
		@question = Question.new
	end

	def edit

	end

	def update

		if @question.update_attributes(question_attributes)
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

	def vote_up
		@question.increment!(:vote_count)
		session[:has_voted] = true
		redirect_to @question
	end

	def vote_down
	end

	def search
	end



	private

	def question_attributes
		params.require(:question).permit([:title, :description])
	end

	def find_question
		@question = Question.find params[:id]
	end
end
