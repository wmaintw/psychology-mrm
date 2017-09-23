get '/dashboard' do
  if !is_logged_in?
    redirect to(:login)
  else
    @users = User.all
    erb :'dashboard/dashboard', :layout => :main, :locals => {:current_user => session[:current_user]}
  end
end
