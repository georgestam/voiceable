class User < ApplicationRecord
  acts_as_token_authenticatable
  
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
  
  private
  
end


