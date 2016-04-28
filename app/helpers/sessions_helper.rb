module SessionsHelper

  def log_in(coach)
   session[:coach_id] = coach.id
  end

  def logged_in?
    !current_user.nil?
  end
end
