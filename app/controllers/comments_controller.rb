class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_answer

  def create
    @comment = @answer.comments.new(params.require(:comment).permit(:body))
    if @comment.save
      redirect_to @answer.question
    else
      flash.now[:alert] = "comment wasn't created!"
      render "questions/show"
    end
  end

  def destroy
    @comment = @answer.comments.find(params[:id])
    @comment.destroy
    redirect_to @answer.question, notice: "comment destroyed!"
  end


  def find_answer
    @answer = Answer.find(params[:answer_id])
  end
end
