class PhotosController < ApplicationController
#before_filter :set_tags_attribute
def new
	@user=User.find(params[:user_id])
	@album=@user.albums.find(params[:album_id])
	@photo=@album.photos.build
	@tags=Tag.new
	#@tags.tname = ['','','']

end
def create
	@user=User.find(params[:user_id])
	@album=@user.albums.find(params[:album_id])
	@photo=@album.photos.build(photo_params)
	@tags=@photo.tags.build(params[:tags])
	#debugger
#@tags=@photo.tags.build(params[:tags_attributes])
	
#@tags=Tag.create(tag_params)

#debugger
#params[:tags][:tname].split(",").each do |tag|
#Tag.where(:tname => tag).first_or_create(:tname => tag)

#@photo.tags << Tag_id
#end
		if @photo.save
			#debugger
			#@tags.photos << @photo
			flash[:sucess]="The photo and tags was added!"
		redirect_to user_album_path(@user.id,@album.id)
	else
		render 'new'
	end
end
def edit
	@album=Album.find(params[:album_id])
	@photo=Photo.find(params[:id])
end
def update
	@photo=Photo.find(params[:id])
	if @photo.update_attributes(photo_params)
		flash[:sucess]="The photo was updated!"
		redirect_to user_album_path
	else
		render 'edit'
	end
end
def destroy
	@photo=Photo.find(params[:id])
	@photo.destroy
	flash[:sucess]="The photo was destroyed."
	redirect_to user_albums_path
end
private
def photo_params
	params.require(:photo).permit(:image,:title,:tags_attributes)
end
def tag_params
	params.require(:tags).permit(:tname)
end
def set_tags_attribute
	@photo.tags_attributes = params[:tname]
end
end