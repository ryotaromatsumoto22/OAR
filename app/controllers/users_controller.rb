class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@projects = @user.projects
		@project_for_graph = {}
		@projects_for_data = ProjectDatum.where(user_id :@user_id)
		@projects_for_data.group_by(&:project_id).each{ |name,value|
			h = {}
			value.group_by{|p| p.date.to_date}.each{ |k,v|
				h[k] = v.sum(&:hour)
			}
			@project_for_graph[name] = h
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
	end
	

	private
		def user_params
			params.require(:user).permit(:name, :introduce, :image, :level)
		end
end
