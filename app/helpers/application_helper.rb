module ApplicationHelper

  def sign_up_page?
    (controller_name.in? %w[registrations sessions]) && action_name != 'edit'
  end 
  
  def homepage?
    (controller_name.in? %w[pages]) && action_name == 'index'
  end
  
end
