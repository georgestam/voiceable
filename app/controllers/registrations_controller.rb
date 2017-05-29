class RegistrationsController < Devise::RegistrationsController
  respond_to :json, only: [:create]
  
  # def after_sign_up_path_for(resource)
  #   '/welcome'
  # end
  # 
  # def after_sign_in_path_for(resource)
  #   (session[:"user.return_to"].nil?) ? "/" : session[:"user.return_to"].to_s
  # end

  def edit
    @page_class = 'edit-profile'
  end

  def update
    # flash[:notice] = 'Your profile has been updated.'
    super
  end

  def new
    @page_class = 'sign-up-page'
    # @users = User.all.where("avatar_file_name <> ''").where("sits_count > 1").sample(6)
    super
  end

  def create
    if params[:user] && params[:user][:email]
      Blacklist::EMAIL_PATTERNS.each do |pattern|
        if params[:user][:email] =~ pattern
          flash[:error] = "Registration blocked, abuse reported! If you think this is in error, please contact hello@opensit.com"
          Rails.logger.error("Registration blocked via blacklist! #{params[:user][:email]}")
          redirect_to root_path
          return
        end
      end
    end
    # @users = User.all.where("avatar_file_name <> ''").where("sits_count > 1").sample(6)
    super
  end
  
end 
