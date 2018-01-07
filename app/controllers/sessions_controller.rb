class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])
            puts "Inside sessionController create"
            session[:user_id] = user.id
            redirect_to "/ideas"
        else
            flash[:error] = "Invalid information"
            redirect_to "/"
        end
    end

    def destroy
        reset_session
        # session.clear
        redirect_to "/"
        # Log User out
        # set session[:user_id] to null
        # redirect to login page
    end


    # private

    #     def login_params
    #         params.require(:login).permit(:email, :password) if params[:login].present?
    #     end
end
