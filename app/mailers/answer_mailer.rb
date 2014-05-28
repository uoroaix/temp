class AnswerMailer < ActionMailer::Base
  default from: "noreply@awesomeanswers.com"

  def notify_question_owner(answer)
    @answer = answer
    @question = answer.question
    @receiver = @question.user
    mail(to: @receiver.email,
         subject: "You've got new answer on your question")
  end

end
