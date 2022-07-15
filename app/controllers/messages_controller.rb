class MessagesController < ApplicationController
    def index
    end

    def edit
        @project = Project.find(params[:project_id])
        @topic = Topic.find(params[:topic_id])
        @message = Message.find(params[:id])
    end

    def create
        @topic = Topic.find(params[:topic_id])
        @message = @topic.messages.build(post_params.merge(:user_id => current_user.id))

        if @message.save
            redirect_to request.referer
        else
            flash[:alert] = "Failed to save"
            redirect_to request.referer
        end
    end

    def update
        @message = Message.find(params[:id])
        if @message.update(post_params)
          flash[:success] = "Topic item successfully updated!"
          redirect_to project_topics_path
        else
          flash.now[:error] = "Topic item update failed"
          redirect_to request.referer
        end
    end

    def destroy
        @message = Message.find(params[:id])
        
        @message.destroy
        flash[:success] = "The to-do item was successfully destroyed."
        redirect_to project_topics_path
    end

    private

    def post_params
        params.require(:message).permit(:message)
    end
end
