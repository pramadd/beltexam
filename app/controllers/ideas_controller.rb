class IdeasController < ApplicationController
    def index
        @ideas =Idea.all
       
        @user = User.find(session[:user_id])
    end

    def new

    end

    def create
        @user = User.find(session[:user_id])
        puts "inside idea controller create"
        @idea = Idea.new(user_id: session[:user_id], content: params[:content])
        if @idea.valid?
            @idea.save
            redirect_to "/ideas"
        else
            flash[:errors] = @idea.errors.full_messages
            redirect_to "/ideas"
        end

    end

    def show
        @idea = Idea.find(params[:id])
    end

    def destroy
        @idea = Idea.find(params[:id]).destroy
        redirect "'ideas'"
    end

    # private

    #     def message_helper
    #         params.require(:idea).permit(content).merge(user:current_user) if params[:ideas].present?
    #     end

end
