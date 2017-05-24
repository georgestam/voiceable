class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  
  before_action :set_locale
  
  include Pundit
  
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  
  helper_method :public_home_page?
  def public_home_page?
    params[:controller].in?(%w(pages application)) && 'home'.in?([params[:id], params[:action]])
  end
  
  helper_method :sign_up_page?
  def sign_up_page?
    (controller_name.in? ['registrations', 'sessions']) && controller.action_name != 'edit'
  end 
  
  private
  
  def set_locale #  i18n
    I18n.locale = I18n.default_locale
  end
  
  def skip_pundit? #  Pundit
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
  
end
