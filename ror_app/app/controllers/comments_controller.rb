#Controller for model Comments, you have to fit the http authentification method to edit, create, or destroy user
class CommentsController < ApplicationController

   http_basic_authenticate_with :name => "sam", :password => "sam"
   	#invoke to create comment
	def create
		@user = User.find(params[:user_id])
		@comment = @user.comments.create(params[:comment])
		redirect_to user_path(@user)
	end
	#invoke to destroy comment
	def destroy
		@user = User.find(params[:user_id])
		@comment = @user.comments.find(params[:user_id])
		@comment.destroy
		redirect_to user_path(@user)
	end
end
