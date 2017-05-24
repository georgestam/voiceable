class PagesController < ApplicationController
  
  skip_before_action :authenticate_user!, only: %i[index]
  
  def index
    if user_signed_in?
      redirect_to controller: :users, action: :me
    else
      @page_class = 'front-page'
    end
  end
  
end
