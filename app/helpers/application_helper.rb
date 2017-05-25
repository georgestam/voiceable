module ApplicationHelper

  def sign_up_page?
    (controller_name.in? %w[registrations sessions]) && action_name != 'edit'
  end 
  
end
