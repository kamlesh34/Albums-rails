class CommentsController < ApplicationController
def new
	@user=User.find(current_user.id)
	@sharing=Sharing.find(params[:sharing_id])
	@comment=@sharing.comments.build
end
def create
	@sharing=Sharing.find(params[:sharing_id])
	@comment=@sharing.comments.build(comments_params)
	if @comment.save
		redirect_to sharings_path
	else
		render 'new'
	end
end
private
def comments_params
	params.require(:comment).permit(:comment, :author)
end
end
