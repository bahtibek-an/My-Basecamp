class TopicsController < ApplicationController
    def index
        @topics = Project.find(params[:project_id]).topics
    end

    def new
        @topic = Topic.new
    end

    def edit
        @project = Project.find(params[:project_id])
        @topic = Topic.find(params[:id])
    end

    def create
        project = Project.find(params[:project_id])
        @Topic = project.topics.build(post_params)

        if @Topic.save
            flash[:notice] = "Successfully task added"
            redirect_to request.referer
        else
            flash[:alert] = "Failed to save"
            redirect_to request.referer
        end
    end

    def update
        @project = Project.find(params[:project_id])
        @topic = Topic.find(params[:id])
        if @topic.update(post_params)
          flash[:success] = "Topic item successfully updated!"
          redirect_to project_topics_path
        else
          flash.now[:error] = "Topic item update failed"
        end
    end

    def destroy
        @Topic = Topic.find(params[:id])

        @Topic.messages.destroy_all if @Topic.messages
        
        @Topic.destroy
        flash[:success] = "The to-do item was successfully destroyed."
        redirect_to request.referer
    end

    private

    def post_params
        params.require(:topic).permit(:title)
    end
end
