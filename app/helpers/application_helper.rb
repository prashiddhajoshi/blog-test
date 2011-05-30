module ApplicationHelper
  def logged?
    if self.logged_in?
      link_to "New Post", new_user_post_path(current_user)
    else
      link_to "Login", login_path
    end
  end
end
