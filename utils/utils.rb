helpers do
  def return_page(page, message = '')
    erb page, :layout => :main, :locals => {:message => message}
  end

  def is_valid_input_for_login(username, password)
    return is_not_empty(username) && is_not_empty(password)
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
