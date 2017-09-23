get '/register' do
  return_page(:'register/new')
end

post '/register' do
  username = params[:username]
  password1 = params[:password1]
  password2 = params[:password2]

  is_valid, message = validate_input_for_register(username, password1, password2)
  if !is_valid
    halt erb(:'register/new', :layout => :main, :locals => {:message => '注册失败，' + message})
  end

  if is_duplicate(username)
    halt erb(:'register/new', :layout => :main, :locals => {:message => '注册失败，该手机号已存在，请直接登录'})
  end

  encrypted_password = Digest::SHA512.hexdigest password1
  user = User.new(:username => username, :password => encrypted_password)
  user.save

  password1 = ''
  password2 = ''
  user.password = ''
  logged_in_user = User.new(:username => username, :name => '')
  session[:current_user] = logged_in_user

  redirect to(:dashboard)
end

helpers do
  def validate_input_for_register(username, password1, password2)
    return false, '手机号和密码不能为空' if is_empty(username) || is_empty(password1) || is_empty(password2)
    return false, '手机号和密码长度超限' if username.length > 11 || password1.length > 20 || password1.length > 20
    return false, '两次输入的密码不一致' if password1 != password2
    return true, ''
  end

  def is_duplicate(username)
    user = User.first(:username => username)
    return user != nil
  end
end
