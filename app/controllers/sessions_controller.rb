class SessionsController < ApplicationController

    def new

    end

    def create
      coach = Coach.find_by(email: params[:session][:email].downcase)
      # If the user exists AND the password entered is correct.
      if coach && coach.authenticate(params[:session][:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        session[:coach_id] = coach.id
        redirect_to '/'
      else
        flash.now[:danger] = 'Invalid email/password combination'
      # If user's login doesn't work, send them back to the login form.
        redirect_to '/login'
      end
    end

    def destroy
        session[:coach_id] = nil
        redirect_to '/login'
    end
end
