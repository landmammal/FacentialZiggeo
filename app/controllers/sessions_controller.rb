class SessionsController < ApplicationController

    def new

    end

    def create
      coach = Coach.find_by(id: session[:coach_id])
      # redirect_to "/coaches/1"
      # If the user exists AND the password entered is correct.
      if coach && coach.authenticate(params[:session][:password])
        # Save the user id inside the browser cookie. This is how we keep the user
        # logged in when they navigate around our website.
        # # log_in(coach)
        # redirect_to coach
        p "******************"
        p "session test: "
        p coach.id.class
        coach_id = session[:coach_id].to_s
        p "session end"
        p "******************"
        redirect_to "/coaches/1"
      else
        flash.now[:danger] = 'Invalid email/password combination'
      # If user's login doesn't work, send them back to the login form.
        # redirect_to '/login'
        redirect_to "/coaches/1"
      end
    end

    def destroy
        session[:coach_id] = nil
        redirect_to '/login'
    end
end
