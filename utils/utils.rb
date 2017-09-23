helpers do
  def return_page(page, message = '')
    erb page, :layout => :main, :locals => {:message => message}
  end

  def is_empty(param)
    params == nil or param.empty?
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
