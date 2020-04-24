class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
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

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def policy_authorize(record)
    authorize record
  end
end
