class ProjectDataController < ApplicationController

	def new
		@project = Project.find(params[:project_id])
		@project_datum = ProjectDatum.new
		@project_datum.project_id = params[:id].to_i
	end

	def create
		@project_datum = ProjectDatum.new(project_datum_params)
		@project_datum.user_id = current_user.id
		if @project_datum.save
			redirect_to project_path(@project_datum.project_id)
			flash[:success] = "記録しました！"
		else
			redirect_to edit_project_path(@project)
		end
	end

	def edit

	end

	def update
	end

	def destroy
	end

	private
    def project_datum_params
        params.require(:project_datum).permit(:user_id, :project_id, :hour, :date)
    end

end
