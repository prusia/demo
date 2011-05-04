require 'spec_helper'

describe PostsController do

  def mock_post(stubs={})
    @mock_post ||= mock_model(Post, stubs)
  end

  describe "GET index" do
    it "assigns all posts as @posts" do
      Post.stub(:find).with(:all).and_return([mock_post])
      get :index
      assigns[:posts].should == ['mock_post']
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      Post.stub(:find).with("37").and_return(mock_post)
      get :show, :id => "37"
      assigns[:post].should equal(mock_post)
    end
  end

  describe "GET new" do
    it "assigns a new post as @post" do
      Post.stub(:new).and_return(mock_post)
      get :new
      assigns[:post].should equal(mock_post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      Post.stub(:find).with("37").and_return(mock_post)
      get :edit, :id => "37"
      assigns[:post].should equal('mock_post')
    end
  end


  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested post" do
        Post.should_receive(:find).with("37").and_return(mock_post)
        mock_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post => {:these => 'params'}
      end

      it "assigns the requested post as @post" do
        Post.stub(:find).and_return(mock_post(:update_attributes => true))
        put :update, :id => "1"
        assigns[:post].should equal(mock_post)
      end

      it "redirects to the post" do
        Post.stub(:find).and_return(mock_post(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(post_url(mock_post))
      end
    end

    describe "with invalid params" do
      it "updates the requested post" do
        Post.should_receive(:find).with("37").and_return(mock_post)
        mock_post.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :post => {:these => 'params'}
      end

      it "assigns the post as @post" do
        Post.stub(:find).and_return(mock_post(:update_attributes => false))
        put :update, :id => "1"
        assigns[:post].should equal('mock_post')
      end

      it "re-renders the 'edit' template" do
        Post.stub(:find).and_return(mock_post(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      Post.should_receive(:find).with("37").and_return(mock_post)
      mock_post.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the posts list" do
      Post.stub(:find).and_return(mock_post(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(posts_url)
    end
  end
end
