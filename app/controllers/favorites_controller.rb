class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_question

  def create
    @question = Question.find(params[:question_id])
    @favorite = @question.favorites.new
    @favorite.user = current_user
    if @favorite.save
      redirect_to @question, notice: "thank you for fav"
    else
      redirect_to @question, alert: "could not fav"
    end
  end


  def destroy
    @favorite = current_user.favorites.find(params[:id])
    if @favorite.destroy
      redirect_to @question, notice: "you have unfavoured"
    else
      redirect_to @question, alert: "could't unfavoured"
    end
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

end
