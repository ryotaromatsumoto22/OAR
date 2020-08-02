class RelationshipsController < ApplicationController
	before_action :authenticate_user!

	def follow
	  current_user.follow(params[:id])
	  redirect_to request.referer
	end

	def unfollow
	  current_user.unfollow(params[:id])
	  redirect_to request.referer
	end

	def follows
    	@user = User.find(params[:id])
  	end

  	def followers
    	@user = User.find(params[:id])
  	end


	private
		def redirect
	    	case params[:redirect_id].to_i
		    	when 0
		        	redirect_to user_path(user)
		      	when 1
		        	redirect_to users_path
		      	when 2
		        	redirect_to follows_path
		      	when 3
		        	redirect_to followers_path
		    end
	    end
end
