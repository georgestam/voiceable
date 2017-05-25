class UsersController < ApplicationController

  # GET /welcome
  def welcome
    @user = current_user

    # Prevent /welcome being revisited as GA records each /welcome as a new sign up
    if @user.sign_in_count > 1 || (Time.now - @user.created_at > 10)
      redirect_to me_path
      return false
    end

    @users_to_follow = User.active_users.limit(3)
  end

  # GET /main page
  def main
    # @feed_items = current_user.socialstream.paginate(:page => params[:page])
    @user = current_user
    authorize @user
    @latest = @user.latest_sit(current_user)
    # @goals = @user.goals

    # @goals.each do |g|
    #   if g.completed?
    #     @has_completed = true
    #   else
    #     @has_current = true
    #   end
    # end

    @title = 'Home'
    @page_class = 'me'
  end
  
end
