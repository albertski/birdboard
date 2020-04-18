class ApplicationController < ActionController::Base
  helper_method :gravatar_email

  def gravatar_email(hashed_email)
    "https://gravatar.com/avatar/#{hashed_email}?s=60}"
  end

  def require_user
    if !user_signed_in?
      flash[:danger] = "You must be logged in to perform this action"
      redirect_to root_path
    end
  end
end
