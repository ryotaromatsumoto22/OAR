class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@projects = @user.projects
		@project_for_graph = {}
		@projects_for_data = ProjectDatum.where(user_id: @user.id).where("date >= ?", Date.today - 7).order(:date)
		@projects_for_data.group_by(&:project_id).each{ |project_id,value|
			h = {}
			value.group_by{|p| p.date.to_date}.each{ |k,v|
				h[k] = v.sum(&:hour)
			}
			@project_for_graph[project_id] = h
		}
		# @data_for_graph = @project_for_graph.map{|project_id, value| {Project.find(project_id).name => value}}.reduce(:merge)
		
		@title_for_graph = {}
		@projects.each{ |project|
			@title_for_graph[project.id] = project.name
		}


	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
    	if @user.update(user_params)
      		redirect_to user_path(@user)
    	else
      		render 'edit'
		end
	end

	def index
		@users = User.all
	end
	

	private
		def user_params
			params.require(:user).permit(:name, :introduce, :image, :level)
		end
end
