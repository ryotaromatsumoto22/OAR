class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@projects = @user.projects

		#グラフ用のハッシュ作成
		@project_for_graph = {}
		#一週間分のユーザーの時間データ
		@projects_for_data = ProjectDatum.where(user_id: @user.id).where("date >= ?", Date.today - 7).order(:date)
		#上記のデータをプロジェクトでグループ化しハッシュ作成
		@projects_for_data.group_by(&:project_id).each{ |project_id,value|
			#日付=>データのハッシュを作成するため
			h = {}
			#日付でグループ化しハッシュにする
			value.group_by{|p| p.date.to_date}.each{ |k,v|
				h[k] = v.sum(&:hour)
			}
			@project_for_graph[project_id] = h
		}
		
		#グラフタイトル
		@title_for_graph = {}
		@projects.each{ |project|
			@title_for_graph[project.id] = project.name
		}


	end

	def edit
		@user = User.find(params[:id])
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to root_path
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
		@users = User.page(params[:page]).per(20).reverse_order
	end
	

	private
	def user_params
		params.require(:user).permit(:name, :introduce, :image, :level)
	end
end
