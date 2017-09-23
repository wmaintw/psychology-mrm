get '/dashboard' do
  if !is_logged_in?
    redirect to(:login)
  else
    @users = User.all
    erb :'users/users', :layout => :main, :locals => {:users => @users}
  end
end
