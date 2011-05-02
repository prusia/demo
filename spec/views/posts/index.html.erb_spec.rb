require 'spec_helper'

describe "/posts/index.html.erb" do
  include PostsHelper

  before(:each) do
    assigns[:posts] = [
      stub_model(Post,
        :title => "value for title",
        :body => "value for body",
        :author => 1
      ),
      stub_model(Post,
        :title => "value for title",
        :body => "value for body",
        :author => 1
      )
    ]
  end

  it "renders a list of posts" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for body".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
