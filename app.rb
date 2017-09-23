require 'sinatra'
require 'sinatra/json'
require 'rubygems'
require 'digest'
require './controllers/login_controller.rb'
require './controllers/dashboard_controller.rb'
require './controllers/user_controller.rb'
require './services/user_service.rb'
require './models/models.rb'
require './utils/utils.rb'

enable :sessions

get '/' do
  redirect to(:login)
end
