require 'spec_helper'

describe Post, "a useful commnet", :behaviour_type => :model do
  before(:each) do
    @valid_attributes = {
      :title => "value for title",
      :body => "value for body",
      :author => 1,
      :created_at => Time.now,
      :updated_at => Time.now
    }
  end

  it "should create a new instance given valid attributes" do
    Post.create!(@valid_attributes)
  end
end
