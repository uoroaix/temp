require 'spec_helper'

describe User do

  describe ".full_name" do

    it "should return first_name + last_name as string" do
      first_name = "Alex"
      last_name = "Kuang"
      user = User.new(first_name: first_name, last_name: last_name)
      expect(user.full_name).to eq("Alex Kuang")
    end

    it "should return email if there aren't any name" do
      email = "uoroaix@gmail.com"
      user = User.new(email: email)
      expect(user.full_name).to eq("uoroaix@gmail.com")
    end


  end

end