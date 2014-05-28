require "spec_helper"


feature "Creating A Question" do

  let(:user) { create(:user) }

  before do
    login_as(user, :scope => :user)
  end

  it "creates an question in the database" do
    visit questions_path
    click_on "Create New Question"
    fill_in "Enter your question's title:", with: "Some valid question title"
    fill_in "Enter your question:", with: "Some valid question description"
    click_on "Submit!"
    expect(current_path).to eq(questions_path)
    expect(page).to have_text /some valid question title/i
  end


  it "doesn't create an question with empty title" do
    visit new_question_path
    fill_in "Enter your question:", with: "Some valid question description"
    click_on "Submit!"
    expect(page).to have_text /Can\'t be blank/i
    expect(Question.count).to eq(0)
  end




end