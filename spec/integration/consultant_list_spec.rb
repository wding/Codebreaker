require 'spec_helper'

describe "list consultants" do
  before :each do
    hash = {:name => "David", :skills_attributes => [{:name => "ruby"},{:name => "java"}]}
    Consultant.create(hash)
  end

  it "should store and retrieve consultants from database" do
    get 'consultants'
    response.should have_selector("th", :content => "Name")
    response.should have_selector("td", :content => "David")
    response.should have_selector("td", :content => "ruby, java")
  end

end
