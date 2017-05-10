class PagesController < ApplicationController
  
  skip_before_action :authenticate_user!, only: %i[index]
  
  include HighVoltage::StaticPage
  skip_after_action :verify_authorized
  
end
