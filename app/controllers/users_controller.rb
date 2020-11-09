class UsersController < ApplicationController

    before_action :validate_signup, only: :create
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(name: user_params[:name])
        @user.password = user_params[:password]
        if @user.save
            session[:user_id] = @user.id
            redirect_to home_path
        else
            redirect_to sign_up_path
        end
    end

    private

    def validate_signup
        if !user_params[:name] || user_params[:name] == ""
            flash[:name_error] = "You must enter a valid name"
        end

        if user_params[:password] != user_params[:password_confirmation]
            flash[:password_error] = "Passwords did not match."
        end

        if user_params[:password] == "" || !user_params[:password]
            flash[:empty_password] = "Passwords cannot be left blank."
        end
        
        redirect_to sign_up_path if flash.any?
    end

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
