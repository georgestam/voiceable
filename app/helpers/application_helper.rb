module ApplicationHelper

  def sign_up_page?
    (controller_name.in? %w[registrations sessions]) && action_name != 'edit'
  end 
  
  def homepage?
    (controller_name.in? %w[pages]) && action_name == 'index'
  end
  
  def form_element(f, field, model, label, input_width,  options = {})
    form = "<div class='form-group'><label class='col-lg-2 control-label' for='#{model}_#{field}'>"
    form << label
    form << '</label>'
    form << "<div class=\"col-lg-#{input_width}\">"
    other = f.input field, options
    form << other
    form << '</div></div>'
    return form.html_safe
  end
  
end
