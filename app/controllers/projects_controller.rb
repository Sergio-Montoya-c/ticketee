class ProjectsController < ApplicationController
  before_action :get_project, only: [:show, :edit, :update]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
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

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = "The project was successfully created!"
      redirect_to @project
    else
      flash.now[:alert] = "Project has not been created."
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def get_project
    @project = Project.find(params[:id])
  end

end
