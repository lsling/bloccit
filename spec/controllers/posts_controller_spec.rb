require 'rails_helper'

## RSpec created a test for PostsController
RSpec.describe PostsController, type: :controller do
  ## we create a post and assign it to my_post using let
  let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #index" do
    it "returns http success" do
      ## the test performs a GET on the index view and expects the response to be successful
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_post] to @posts" do
       get :index
 # # because our test created one post (my_post), we expect index to return an array of one item
       expect(assigns(:posts)).to eq([my_post])
     end
  end
 ## we comment out the tests for show, new, and edit since we won't write the implementation until later
  #  describe "GET show" do
  #    it "returns http success" do
  #      get :show
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

  # describe "GET new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  #  describe "GET edit" do
  #    it "returns http success" do
  #      get :edit
  #      expect(response).to have_http_status(:success)
  #    end
  #  end

end
