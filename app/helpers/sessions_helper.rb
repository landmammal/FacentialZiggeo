module SessionsHelper

  def log_in(coach)
   session[:coach_id] = coach.id
  end

  def current_user
    @current_user ||= Coach.find_by(id: session[:coach_id])
  end

  # Returns true if the user is logged in, false otherwise.
def logged_in?
  !current_user.nil?
end
end
