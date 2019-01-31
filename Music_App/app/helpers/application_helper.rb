module ApplicationHelper

  def auth_token
    "<input
    type='hidden'
    name='authenticity_token'
    value= '#{form_authenticity_token}'/>".html_safe
  end

  def logout
    "<form action='#{session_url}' method='POST'>
      <input type='hidden' name='_method' value='DELETE'>
      #{auth_token}
      <input type='submit' value='Logout' class='btn btn-danger'>
    </form>".html_safe
  end

end
