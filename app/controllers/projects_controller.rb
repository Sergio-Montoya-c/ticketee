class ProjectsController < ApplicationController
  before_action :get_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    respond_to do |format|
      format.json do 
        render json: @projects.to_json
      end
      format.html
    end
  end

  def new
    @project = Project.new
  end

  def show
    respond_to do |format|
      format.json do
        render json: @project.to_json
      end
      format.html
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Project has been deleted."
      redirect_to projects_path
    else
      flash[:notice] = "Something went wrong."
      render :delete
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
