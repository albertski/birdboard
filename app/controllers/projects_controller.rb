class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :run_authorize, only: [:show, :edit, :delete]

  # GET /projects
  # GET /projects.json
  def index
   projects_as_owner = Project.where(user_id: current_user.id).ids
   projects_as_member = Project.joins(:members).where(users: { id: current_user.id }).ids
   @projects = Project.where(id: [projects_as_owner, projects_as_member].flatten).order('updated_at DESC')
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @task = Task.new
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
    authorize @project
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:title, :description, :notes)
  end

  def verify_project_access
    if @project.user != current_user && !@project.members.exists?(current_user.id)
      flash[:danger] = "You don't have access this project"
      redirect_to projects_url
    end
  end
end
