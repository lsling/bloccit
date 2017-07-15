module TopicsHelper
  def user_is_authorized_for_topics?
     0 if current_user && current_user.admin?
     1 if current_user && current_user.moderator?
  end
end
