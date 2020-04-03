class ApplicationController < ActionController::Base

  def authenticate_user!
    unless current_user
      flash[:error] = 'Please sign/sign-up in to continue'
      redirect_to root_path
    end
  end
end
