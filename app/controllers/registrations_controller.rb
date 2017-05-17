class RegistrationsController < Devise::RegistrationsController
  respond_to :json, only: [:create]

  def create
    binding.pry
  end 
end 
