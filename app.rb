require 'sinatra'
require 'sinatra/json'
require 'rubygems'
require 'digest'
require './controllers/login_controller.rb'
require './controllers/register_controller.rb'
require './controllers/dashboard_controller.rb'
require './controllers/user_controller.rb'
require './services/user_service.rb'
require './models/models.rb'
require './utils/utils.rb'

enable :sessions

before '/*' do
  if !['/', '/login', '/logout', '/register'].include?(request.path)
    if !is_logged_in?
      redirect to(:login)
      halt
    end
  end
end

get '/' do
  redirect to(:login)
end
