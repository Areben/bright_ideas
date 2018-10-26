class UsersController < ApplicationController
    def main
        render 'main'
    end

    def show
        @user = User.find(params[:u_id])

        @ideas = 0
        @user.ideas.each do |idea|
            @ideas += 1
        end

        @likes = 0
        @user.likes.each do |like|
            @likes += 1
        end

        render 'show'
    end
end
