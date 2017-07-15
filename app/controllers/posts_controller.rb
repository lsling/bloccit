class PostsController < ApplicationController
  ## we use a before_action filter to call the require_sign_in method before each of our controller actions, except for the show action
  before_action :require_sign_in, except: :show

  before_action :authorize_user, except: [:show, :new, :create]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
  end

  def create
# #9 we call Post.new to create a new instance of Post
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user

  # #10 if we successfully save Post to the database, we display a success message using flash[:notice] and redirect the user to the route generated by @post
    if @post.save
  # #11 we assign a value to flash[:notice]
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
  # #12 if we do not successfully save Post to the database, we display an error message and render the new view again
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  @post = Post.find(params[:id])
  @post.assign_attributes(post_params)

  if @post.save
    flash[:notice] = "Post was updated."
    redirect_to [@post.topic, @post]
  else
    flash.now[:alert] = "There was an error saving the post. Please try again."
    render :edit
  end
end

def destroy
  @post = Post.find(params[:id])

# #8 we call destroy on @post
  if @post.destroy
    flash[:notice] = "\"#{@post.title}\" was deleted successfully."
    redirect_to @post.topic
  else
    flash.now[:alert] = "There was an error deleting the post."
    render :show
  end
end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_user
     post = Post.find(params[:id])
     unless current_user == post.user || current_user.admin?
       flash[:alert] = "You must be an admin to do that."
       redirect_to [post.topic, post]
     end
   end
end
