require 'spec_helper'

describe Consultant do
  before :each do
    hash = {:name => "David", :skills_attributes => [{:name => "ruby"},{:name => "java"}]}
    hash2 = {:name => "Pei Shi", :skills_attributes => [{:name => "ruby"}]}
    Consultant.create(hash)
    Consultant.create(hash2)
  end
  it "should create only one skill for each given name" do
    Skill.count.should == 2
  end
  it "should associate skill with consultant" do
    Consultant.first.skills.count.should == 2
  end
  it "should return all skills in one string" do
    Consultant.first.all_skills.should eql "ruby, java"
  end
end
