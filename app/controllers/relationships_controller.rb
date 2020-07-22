class RelationshipsController < ApplicationController

	def follow
	  current_user.follow(params[:id])
	  redirect_to request.referer
	end

	def unfollow
	  current_user.unfollow(params[:id])
	  redirect_to request.referer
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
