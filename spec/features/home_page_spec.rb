require "spec_helper"



feature "Visiting Home Page" do
  
  it "contains a text Listing All Questions" do
    visit root_path
    expect(page).to have_text /listing all questions/i
  end
end