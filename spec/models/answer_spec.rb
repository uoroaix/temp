require 'spec_helper'

describe Answer do
  
  it "should be capitalized before inserting into the database" do
    text = "this should be capitalized"
    answer = Answer.new(body: text)
    answer.save
    expect(answer.body).to eq("This should be capitalized")
  end

end