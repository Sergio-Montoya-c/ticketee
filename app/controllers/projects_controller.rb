class ProjectsController < ApplicationController

  def index
    
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "The project was successfully created!"
      redirect_to @project
    else
      # byebug
      flash.now[:alert] = "Project has not been created."
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

end
