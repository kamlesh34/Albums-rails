class SharingsController < ApplicationController
	require 'active_support/core_ext'
def index
	@sharings=Sharing.all.order('created_at DESC')
	@user=User.all
	@comments=Comment.all
	respond_to do |format|
    format.html #for my controller, i wanted it to be JS only
    format.js
end
end
def new
	@user=User.find(params[:user_id])
	@photo=Photo.find(params[:photo_id])
	
end
def create

	@user=User.find(params[:user_id])
	@sharing=@user.sharings.build(sharing_params)
	@album=Album.find(params[:album_id])
	@photo=Photo.find(params[:photo_id])
	if @sharing.save
		@photo.sharings << @sharing
		redirect_to sharings_path
	
	else
		render 'new'
	end
end
def edit
	@sharing=Sharing.find(params[:sharing_id])
	@likes=@sharing.likes
end
def show
@sharing=Sharing.find(params[:id])
@comments=@sharing.comments
@likes=@sharing.likes
end

def destroy
	@user=User.find(params[:user_id])
	@photo=Photo.find(params[:photo_id])
	@sharing=Sharing.find(params[:id])
	@album=Album.find(params[:album_id])
	
	if @photo.sharings.destroy(@sharing) && @sharing.destroy
	flash[:success]="Sucessfully UnShared."
	redirect_to user_album_path(@user, @album)
end

end
private
def sharing_params
	params.require(:sharing).permit(:title)
end
end
