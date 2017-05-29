class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  
  around_action :set_locale
  
  include Pundit
  
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  
  def skip_pundit? #  Pundit
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
  
  def set_locale #  i18n
    I18n.locale = params[:locale] || current_user.try(:locale) || extract_locale_from_accept_language_header || I18n.default_locale
    yield
    I18n.locale = I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: ['first_name', 'last_name', 'avatar', 'dob(3i)', 'dob(2i)', 'dob(1i)', 'gender', 'city', 'country', 'website', 'who', 'why', 'private_stream'])
  end
  
  private
  
  def extract_locale_from_accept_language_header
    language = request.env['HTTP_ACCEPT_LANGUAGE'].presence
    language ? HttpAcceptLangParser.parse(language) : nil
  end
  
end
