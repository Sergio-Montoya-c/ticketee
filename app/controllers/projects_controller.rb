class ProjectsController < ApplicationController
  before_action :get_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
    respond_to do |format|
      format.json do 
        render json: @projects.to_json
      end
      format.html
    end
  end
  
  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project has been updated."
      redirect_to @project
    else
      flash[:notice] = "Project has not been updated."
      render :edit
    end
  end  

  def show
    respond_to do |format|
      format.json do
        render json: @project.to_json
      end
      format.html
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def get_project
    @project = Project.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you are looking for could not be found."
    redirect_to projects_path
  end

end
