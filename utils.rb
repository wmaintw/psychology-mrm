helpers do
  def return_page(page, message = '')
    erb page, :layout => :main, :locals => {:message => message}
  end

  def is_logged_in?
    current_user = session[:current_user]
    current_user != nil and !current_user.empty?
  end

  def is_valid_input_for_login(username, password)
    return ((username != nil and !username.empty?) and (password != nil and !password.empty?))
  end


  def get_default_users
    john = {:name => "John", :username => "john", :password => "john123", :gender => "Male", :age => 24, :email => "john@daq.com"}
    bob = {:name => "Bob", :username => "bob", :password => "bob123", :gender => "Male", :age => 27, :email => "bob@daq.com"}
    alice = {:name => "Alice", :username => "alice", :password => "alice123", :gender => "Female", :age => 26, :email => "alice@daq.com"}
    [john, bob, alice]
  end

  def find_user(username, password)
    users = get_default_users()
    users.select {|u| u[:username] == username && u[:password] == password}
  end

  def is_not_empty(param)
    params != nil && !param.empty?
  end

  def is_num(param)
    result = true
    begin
      Integer(param)
    rescue
      result = false
    end
    return result
  end
end
