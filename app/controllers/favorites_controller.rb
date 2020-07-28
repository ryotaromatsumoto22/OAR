class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @project = Project.find(params[:project_id])
    favorite = @project.favorites.new(user_id: current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    @project = Project.find(params[:project_id])
    favorite = current_user.favorites.find_by(project_id: @project.id)
    favorite.destroy
    redirect_to request.referer
  end


  private
  def redirect
    case params[:redirect_id].to_i
    when 0
      redirect_to projects_path
    when 1
      redirect_to project_path(@project)
    end
  end
end
