class LikesController < ApplicationController

    def create
        Like.new(idea: Idea.find(params[:idea_id]), user_id: session[:user_id])
        redirect_to "/ideas"
    end

    def show
    end

end
