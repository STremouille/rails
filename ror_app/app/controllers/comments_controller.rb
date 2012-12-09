class CommentsController < ApplicationController

   http_basic_authenticate_with :name => "sam", :password => "sam"
	def create
		@user = User.find(params[:user_id])
		@comment = @user.comments.create(params[:comment])
		redirect_to user_path(@user)
	end

	def destroy
		@user = User.find(params[:user_id])
		@comment = @user.comments.find(params[:user_id])
		@comment.destroy
		redirect_to user_path(@user)
	end
end
