class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def dashboard
    redirect_to new_producer_path if current_user.producers.empty?
  end
end
