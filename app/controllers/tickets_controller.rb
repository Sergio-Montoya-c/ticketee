class TicketsController < ApplicationController
  before_action :set_project
  before_action :set_ticket, only: [:show]

  def new
    @ticket = @project.tickets.build
  end

  def show
  end

  def index 
  end

  def create
    @ticket = @project.tickets.build(ticket_params)
    if @ticket.save 
      flash[:notice] = "Ticket has been created"
      respond_to do |format|
        format.json do
          render json: @ticket.to_json
        end
        format.html
      end
      redirect_to [@project, @ticket]
    else
      flash.now[:alert] = "Ticket has not been created."
      render 'new'
    end

  end

  private

  def ticket_params
    params.require(:ticket).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_ticket
    @ticket = @project.tickets.find(params[:id])
  end
end
