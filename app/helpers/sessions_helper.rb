module SessionsHelper

  # This places a temporary cookie on the user’s browser containing an encrypted
  # version of the user’s id, which
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if session[:user_id]
      @current_user = @current_user || User.find_by(id: session[:user_id])
      # if @current_user.nil?
      #   # we don't use the find method as it would raise an exception if the user_id is nil, which is often in that case
      #   @current_user = User.find_by(id: session[:user_id])
      # else
      #   @current_user
      # end
    end
  end

  def logged_in?
    !current_user.nil?
  end
end
