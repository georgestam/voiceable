class User < ApplicationRecord
  acts_as_token_authenticatable
  
  LANGUAGES = %w[ar en].freeze
  
  has_many :recordings, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :email, email_format: { message: "doesn't look like an email address" }, presence: true
  
  def socialstream
    # Sit.from_users_followed_by(self).with_body.newest_first
  end

  def latest_sit(current_user)
    # return sits.newest_first.limit(1) if self == current_user
    # return sits.communal.newest_first.limit(1)
  end
  
  # Overwrite Devise function to allow profile update without password requirement
  # http://stackoverflow.com/questions/4101220/rails-3-devise-how-to-skip-the-current-password-when-editing-a-registratio?rq=1
  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params)
  end
  
end


