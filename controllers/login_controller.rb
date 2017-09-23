get '/login' do
  return_page(:'login/login')
end

post '/login' do
  username = params[:username]
  password = params[:password]
  return_page(:'login/login', 'Login failed!') unless is_valid_input_for_login(username, password)

  encrypted_password = Digest::SHA512.hexdigest password
  user_in_db = User.first(:username => username, :password => encrypted_password)

  if user_in_db == nil
    return_page(:'login/login', 'Login failed!')
  else
    session[:current_user] = user_in_db
    redirect to(:dashboard)
  end
end

get '/logout' do
  session.clear
  redirect to(:login)
end
