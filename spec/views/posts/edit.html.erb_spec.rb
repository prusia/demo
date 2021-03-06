require 'spec_helper'

describe "/posts/edit.html.erb" do

  before(:each) do
    assigns[:post] = @post = stub_model(Post,
      :new_record? => false,
      :title => "value for title",
      :body => "value for body",
      :author => 1
    )
  end

  it "renders the edit post form" do
    render

    response.should have_tag("form[action=#{post_path(@post)}][method=post]") do
      with_tag('input#post_title[name=?]', "post[title]")
      with_tag('textarea#post_body[name=?]', "post[body]")
      with_tag('input#post_author[name=?]', "post[author]")
    end
  end
end
