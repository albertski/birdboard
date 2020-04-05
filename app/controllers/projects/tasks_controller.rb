module Projects
  class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :require_user
    before_action :can_access_task?, only: [:show]

    # GET /projects/{id}/tasks
    # GET /projects/{id}/tasks.json
    def index
      @tasks = current_user.projects.all
    end

    # GET /projects/{id}/tasks/1
    # GET /projects/{id}/tasks/1.json
    def show
    end

    # GET /projects/{id}/tasks/new
    def new
      @task = Task.new
    end

    # GET /projects/{id}/tasks/1/edit
    def edit
    end

    # POST /projects/{id}/tasks
    # POST /projects/{id}/tasks.json
    def create
      @task = Task.new(task_params)
      @task.user = current_user
      @task.project = Project.find(params[:project_id])
      respond_to do |format|
        if current_user.id == @task.project.user.id && @task.save
          format.html { redirect_to @task, notice: "Task was successfully created." }
          format.json { render :show, status: :created, location: @task }
        else
          format.html { render :new }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /projects/{id}/tasks/1
    # PATCH/PUT /projects/{id}/tasks/1.json
    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to @task, notice: "Task was successfully updated." }
          format.json { render :show, status: :ok, location: @task }
        else
          format.html { render :edit }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /projects/{id}/tasks/1
    # DELETE /projects/{id}/tasks/1.json
    def destroy
      @task.destroy
      respond_to do |format|
        format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:body)
    end

    def can_access_task?
      return true
    end
  end
end
