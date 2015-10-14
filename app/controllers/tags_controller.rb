class TagsController < ApplicationController
respond_to :html, :js
def index
	@user=current_user
	@tags=@user.tags
	respond_to do |format|
    format.html
    format.js
  end
end
def new
	@album=Album.find(params[:album_id])
	@photo=@album.photos.find(params[:photo_id])
	@tags=@photo.tags.build
end
def create
	@album=Album.find(params[:album_id])
	@photo=@album.photos.find(params[:photo_id])
		@tags=@photo.tags.build(tag_params)
	if @tags.save
		flash[:sucess]="The tags were added!"
		redirect_to album_path(@album.id)
	else
		render 'new'
	end
end
def show
	@user=current_user
	
	@tag=Tag.find(params[:id])
	@images=@tag.photos
	respond_to do |format|
    format.html
    format.js
  end
end
private
def tag_params
	params.require(:tags).permit(:tname)
end
end
