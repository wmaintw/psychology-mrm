def is_logged_in?
  current_user = session[:current_user]
  current_user != nil
end
