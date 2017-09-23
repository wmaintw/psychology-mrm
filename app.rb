require 'sinatra'
require 'sinatra/json'
require 'rubygems'
require './models/models.rb'

get '/' do
  'Hello world!'
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
