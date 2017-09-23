get '/login' do
  return_page(:'login/login')
end

post '/login' do
  username = params[:username]
  password = params[:password]

  is_valid = validate_input_for_login(username, password)
  if !is_valid
    halt erb(:'login/login', :layout => :main, :locals => {:message => '登录失败，请正确填写手机号和密码'})
  end

  encrypted_password = Digest::SHA512.hexdigest password
  user_in_db = User.first(:username => username, :password => encrypted_password)
  password = ''
  encrypted_password = ''

  if user_in_db == nil
    return_page(:'login/login', '登录失败，手机号和密码不匹配')
  else
    user_in_db.password = ''
    session[:current_user] = user_in_db
    redirect to(:dashboard)
  end
end

get '/logout' do
  session.clear
  redirect to(:login)
end

helpers do
  def validate_input_for_login(username, password)
    return false if is_empty(username) || is_empty(password)
    return false if username.length > 11 || password.length > 20
    return true
  end
end
