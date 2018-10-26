class BrightController < ApplicationController
    def create
        @idea = User.find(session[:user_id]).ideas.new(idea_params)
        if @idea.save
            redirect_to "/bright_ideas", notice: "Succesfully created an idea"
        else
            redirect_to "/bright_ideas", notice: "Could not create idea"
        end
    end

    def destroy
        @idea = Idea.find(params[:i_id])
        @idea.destroy
        redirect_to "/bright_ideas", notice: "Succesfully destroyed an idea"
    end

    def like
        @like = Like.find_by(user_id: session[:user_id], idea_id: params[:i_id])

        if @like == nil
            @like = Idea.find(params[:i_id]).likes.new(user_id: session[:user_id])
            
            if @like.save
                redirect_to "/bright_ideas", notice: "Succesfully liked an idea"
            else
                redirect_to "/bright_ideas", notice: "Could not like this idea"
            end
        else
            redirect_to "/bright_ideas", notice: "You have already liked this idea"
        end
    end

    def unlike
        redirect_to "/bright_ideas", notice: "Succesfully unliked an idea"
    end

    private
        def idea_params
            params.require(:idea).permit(:idea)
        end
end



# @like = Like.new(like_params)
# if @like.save
#     redirect_to "/bright_ideas", notice: "Succesfully created a idea"
# else
#     redirect_to "/bright_ideas", notice: "Could not like for this idea"
# end
