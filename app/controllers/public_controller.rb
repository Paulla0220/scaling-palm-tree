class PublicController < ApplicationController
  layout false
  
  def home
    redirect_to profile_path(current_user.id) if user_signed_in?
  end
  
end
