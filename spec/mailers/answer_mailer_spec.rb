require "spec_helper"




describe AnswerMailer do
  
  let(:user) { create(:user) }
  let(:user1) { create(:user) }
  let(:question) { create(:question, user: user) }
  let(:answer) { create(:answer, question: question, user: user1 )}

  describe "#notify_question_owner" do


    subject { AnswerMailer.notify_question_owner(answer) }
    its(:to) { should eq([user.email])}
    its(:from) { should eq(["noreply@awesomeanswers.com"])}
    its("body.encoded.to_s") { should match /#{answer.body}/i }


    it "should b asdfsdf" do
      pending "WRITE ME"
    end

    # before do
    #   @mail = AnswerMailer.notify_question_owner(answer)
    # end

    # it "sends email to question owner" do
    #   expect(@mail.to).to eq([user.email])

    # end

    # it "sends email from noreply@awesomeanswers.com" do
    #   expect(@mail.from).to eq(["noreply@awesomeanswers.com"])
    # end

    # it "contains the answer body in the email body" do
    #   expect(@mail.body.to_s).to match /#{answer.body}/i
    # end

  end


end