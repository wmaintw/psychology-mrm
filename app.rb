require 'sinatra'
require 'sinatra/json'
require 'rubygems'
require 'digest'
require './models/models.rb'
require './utils.rb'

enable :sessions

get '/' do
  redirect to(:login)
end

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
    redirect to(:users)
  end
end

get '/logout' do
  session.clear
  redirect to(:login)
end

get '/create-user' do
  @user = User.new(:username => 'user1', :password => '123123', :name => 'user 1')
  @user.save
end

get '/users.json' do
  @users = User.all
  json @users
end

get '/users' do
  @users = User.all
  erb :users, :layout => :main, :locals => {:users => @users}
end

get '/user' do
  erb :users_new, :layout => :main
end

post '/users' do
  username = params[:username]
  password = params[:password]
  name = params[:name]

  user = User.new(:username => username, :password => password, :name => name)
  user.save

  redirect to(:users)
end
