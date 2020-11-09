class SessionsController < ApplicationController

    # before_action :validate_user
    
    def create
        @user = User.find_by(name: session_params[:name])
        return head(:forbidden) unless @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
        redirect_to home_path
    end

    private

    def session_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end