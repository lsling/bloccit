class PostsController < ApplicationController
  def index
    ## we declare an instance variable @posts and assign it a collection of Post objects using the all method provided by ActiveRecord
    @posts = Post.all
    @posts.each_with_index do |k, v|
      if v % 5 == 0
        k.title = "SPAM"
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
