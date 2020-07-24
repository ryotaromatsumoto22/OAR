class ProjectDataController < ApplicationController

	def new
		@project = Project.find(params[:project_id])
		@project_datum = ProjectDatum.new
		@project_datum.project_id = params[:id].to_i
	end

	def create
		@project = Project.find(params[:project_id])
		@project_datum = ProjectDatum.new(project_datum_params)
		@project_datum.user_id = current_user.id
		@project_datum.project_id = @project.id
		if @project_datum.save
			redirect_to project_path(@project_datum.project_id)
			flash[:success] = "記録しました！"
		else
			redirect_to new_project_datum_path(@project)
		end
	end

	def edit
		@project_datum = ProjectDatum.find(params[:id])

	end

	def update
		@project_datum = ProjectDatum.find(params[:id])
    	if @project_datum.update(project_datum_params)
	      	redirect_to user_path(current_user)
	      	flash[:success] = "変更しました！"
    	else
      		render edit_project_datum_path(params[:id])
    	end
	end

	def destroy
		@project_datum = ProjectDatum.find(params[:id])
		params[:id] = @project_datum.project_id
		@project_datum.destroy
      	redirect_to project_path(params[:id]), notice: 'Project was successfully destroyed.'
	end

	private
    def project_datum_params
        params.require(:project_datum).permit(:user_id, :project_id, :hour, :date)
    end

end
