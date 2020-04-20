module Projects
  class InvitationController < ApplicationController
    before_action :set_user

    # POST /projects/{id}/invitation
    # POST /projects/{id}/invitation.json
    def create
      @project = Project.find(params[:project_id])
      if @user
        @project.invite(@user)
      else
        redirect_to @project, alert: "Invalid user was entered"
        return
      end
      respond_to do |format|
        if @project.save
          format.html { redirect_to @project, notice: "User was successfully added." }
          format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_user
      @user = User.with_email(params[:email]).first
    end
  end
end
