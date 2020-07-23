class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
    @project_data = @project.project_data

    if params[:view] == "monthly"
      @project_for_graph = {}
      @projects_for_data = ProjectDatum.where("(project_id = ?) AND (date >= ?)", @project.id, Date.today - 30).order(:date)
      @projects_for_data.group_by(&:project_id).each{ |project_id,value|
        h = {}
        value.group_by{|p| p.date.month}.each{ |k,v|
          h[k] = v.sum(&:hour)
        }
        @project_for_graph[project_id] = h
      }
    elsif params[:view] == "yearly"
      @project_for_graph = {}
      @projects_for_data = ProjectDatum.where(project_id: @project.id).order(:date)
      @projects_for_data.group_by(&:project_id).each{ |project_id,value|
        h = {}
        value.group_by{|p| p.date.year}.each{ |k,v|
          h[k] = v.sum(&:hour)
        }
        @project_for_graph[project_id] = h
      }
    else 
      @project_for_graph = {}
      @projects_for_data = ProjectDatum.where("(project_id = ?) AND (date >= ?)", @project.id, Date.today - 7).order(:date)
      @projects_for_data.group_by(&:project_id).each{ |project_id,value|
        h = {}
        value.group_by{|p| p.date.to_date}.each{ |k,v|
          h[k] = v.sum(&:hour)
        }
        @project_for_graph[project_id] = h
      }
    end
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    session[:project] = Project.find(params[:id])
    @project_datum = ProjectDatum.new
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to user_path(current_user)
      flash[:success] = "変更しました！"
    else
      render edit_project_path(params[:id])
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
      redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:user_id, :name, :hour, :date, :goal, :period, :end_of_period, :level)
    end

    def project_datum_params
      params.require(:project_datum).permit(:user_id, :project_id, :hour, :date)
    end
end
