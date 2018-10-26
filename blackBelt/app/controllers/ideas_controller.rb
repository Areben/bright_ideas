class IdeasController < ApplicationController
    def index
        @ideas = Idea.all
        render 'index'
    end

    def show
        @idea = Idea.find(params[:b_id])
        render 'show'
    end
end
