require 'spec_helper'

describe Comment do

  it "doesn't allow creating comment without a content" do
    comment = Comment.new #because I did not add content like body field 
    expect(comment).to_not be_valid # the result should be not valid
  end  

  it "doesn't allow creating comment without a body" do
    comment = Comment.new
    comment.save
    comment.errors.messages.should have_key(:body)
  end

  it "doesn't allow comment shorter than 3 characters" do
    comment = Comment.new(body: "ab")
    expect(comment).to_not be_valid
  end

  describe ".sanitize" do

    it "removes repeated white spaces in the body" do
      text = "body    with duplicate spaces"
      comment = Comment.new(body: text)
      comment.sanitize
      expect(comment.body).to eq("body with duplicate spaces")
    end

    it "strips spaces at the edges of the body text" do
      text = " body with spaces around "
      comment = Comment.new(body: text)
      comment.sanitize
      expect(comment.body).to eq("body with spaces around")
    end

  end

  describe "Recent Ten Comments Scope" do
    
    before do
      11.times {|x| Comment.create!(body: "valid body #{x}")}
    end

    it "returns 10 records" do
      expect(Comment.recent_ten.count).to eq(10)
    end

    it "returns most recent" do
      expect(Comment.recent_ten).to_not include(Comment.first)
    end

  end
end
