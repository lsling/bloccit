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

  describe "GET show" do
    it "returns http success" do
# #16 we pass {id: my_post.id} to show as a parameter
      get :show, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
# #17 we expect the response to return the show view using the  render_template matcher
      get :show, {id: my_post.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: my_post.id}
# #18 we expect the post to equal my_post because we call show with the id of  my_post
      expect(assigns(:post)).to eq(my_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

# #2
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

# #3
    it "instantiates @post" do
      get :new
      expect(assigns(:post)).not_to be_nil
    end
  end

  describe "POST create" do
# #4
    it "increases the number of Post by 1" do
      expect{post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Post,:count).by(1)
    end

# #5
    it "assigns the new post to @post" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(assigns(:post)).to eq Post.last
    end

# #6
    it "redirects to the new post" do
      post :create, post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
      expect(response).to redirect_to Post.last
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, {id: my_post.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_post.id}
# #1 we expect the edit view to render when a post is edited
      expect(response).to render_template :edit
    end

# #2 we test that edit assigns the correct post to be updated to @post
    it "assigns post to be updated to @post" do
      get :edit, {id: my_post.id}

      post_instance = assigns(:post)

      expect(post_instance.id).to eq my_post.id
      expect(post_instance.title).to eq my_post.title
      expect(post_instance.body).to eq my_post.body
    end
  end

  describe "PUT update" do
  it "updates post with expected attributes" do
    new_title = RandomData.random_sentence
    new_body = RandomData.random_paragraph

    put :update, id: my_post.id, post: {title: new_title, body: new_body}

# #3 we test that @post was updated with the title and body passed to update
    updated_post = assigns(:post)
    expect(updated_post.id).to eq my_post.id
    expect(updated_post.title).to eq new_title
    expect(updated_post.body).to eq new_body
  end

  it "redirects to the updated post" do
    new_title = RandomData.random_sentence
    new_body = RandomData.random_paragraph

# #4 we expect to be redirected to the posts show view after the update
    put :update, id: my_post.id, post: {title: new_title, body: new_body}
    expect(response).to redirect_to my_post
  end
end

describe "DELETE destroy" do
  it "deletes the post" do
    delete :destroy, {id: my_post.id}
# #6 we search the database for a post with an id equal to my_post.id
    count = Post.where({id: my_post.id}).size
    expect(count).to eq 0
  end

  it "redirects to posts index" do
    delete :destroy, {id: my_post.id}
# #7  we expect to be redirected to the posts index view after a post has been deleted
    expect(response).to redirect_to posts_path
  end
end

end
