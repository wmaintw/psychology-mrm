get '/dashboard' do
  @users = User.all
  erb :'dashboard/dashboard', :layout => :main, :locals => {:current_user => session[:current_user]}
end
