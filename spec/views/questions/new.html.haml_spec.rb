require "spec_helper"


describe "questions/new.html.haml" do

  before do 
    assign(:question, stub_model(Question))
    render
  end

  it "contains text 'Create New Question'" do
    expect(rendered).to match /create new question/i
  end


  it "renders '_form' template " do
    expect(rendered).to render_template(partial: "_form")
  end

  # it "contains an h1 element" do
  #   expect(rendered).to have_selector("h1")
  # end
  
end