module UsersHelper
  def count_posts(user)
    if @user.posts.count == 0
      return "#{user.name} has not submitted any posts yet."
    else
      render @user.posts
    end
  end

  def count_comments(user)
    if @user.comments.count == 0
      return "#{user.name} has not submitted any comments yet."
    else
      render @user.comments
    end
  end

  def favorited_posts(user)
    if @user.favorites.count == 0
      return "#{user.name} has not favorited any posts yet."
    else
      render @user.favorites.map(&:post)
    end
  end
end
