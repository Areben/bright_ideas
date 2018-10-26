class SessionsController < ApplicationController
    def create
        @user = User.new(user_params)

        if @user.save
            session[:user_id] = @user.id
            redirect_to "/bright_ideas", notice: "You have succesfully created an account and logged in!"
        else
            redirect_to "/main", notice: "Failed to create User"
        end
    end

    def login
        if @user = set_user
            session[:user_id] = @user.id
            redirect_to "/bright_ideas", notice: "You have succesfully signed in"
        else
            redirect_to "/main", notice: "You have entered the wrong email or password"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/main"
    end

    private
        def user_params
            params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
        end

        def set_user
            User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
        end
end
