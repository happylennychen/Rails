class RelationshipsController < ApplicationController
	before_action :signed_in_user
	#before_action :correct_user, only: :destroy
	
	def create
		@user = User.find(params[:relationship][:followed_id])
		current_user.follow!(@user)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
	
	def destroy
		@user = Relationship.find(params[:id]).followed
		current_user.unfollow!(@user)
		respond_to do |format|
			format.html { redirect_to @user }
			format.js
		end
	end
	
	private
	
	def micropost_params
		params.require(:micropost).permit(:content)
	end
	
	def correct_user
		@micropost = current_user.microposts.find_by(id: params[:id])
		redirect_to root_url if @micropost.nil?
	end
end
