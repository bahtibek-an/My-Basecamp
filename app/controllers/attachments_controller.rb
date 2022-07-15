class AttachmentsController < ApplicationController
    def index
        @project = Project.find(params[:project_id])
    end

    def create
        @project = Project.find(params[:project_id])
        
        @project.files.attach(attachment_params[:files])
        @project.save()

        redirect_to project_attachments_path
    end

    def destroy
        @file = ActiveStorage::Attachment.find(params[:attachment_id])
        @file.purge

        redirect_to request.referer
    end

    private

    def attachment_params
        params.require(:attachment).permit(files: [])
    end
end
