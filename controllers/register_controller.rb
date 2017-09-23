get '/register' do
  return_page(:'register/new')
end

post '/register' do
  username = params[:username]
  password = params[:password]
  name = params[:name]

  user = User.new(:username => username, :password => password, :name => name)
  user.save

  redirect to(:dashboard)
end
