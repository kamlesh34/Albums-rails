class AlbumsController < ApplicationController
def index
	@user=User.find(current_user.id)
	@albums=@user.albums.all
	#byebug
	# @cover=Photo.where(params[:album_id] => f.id).first

end
def new
	@user=User.find(current_user.id)
	@album=@user.albums.build
end
def create
	@user=User.find(current_user.id)
	@album=@user.albums.build(album_params)
	if @album.save
		redirect_to '/'
	else
		render 'new'
	end
end
def show
	@user=User.find(params[:user_id])
	@album=@user.albums.find(params[:id])
	@images=@album.photos

end
def edit
	@user=User.find(params[:user_id])
	@album=@user.albums.find(params[:id])
end
def update
	@user=User.find(:user_id)
	@album=@user.albums.find(params[:id])
	if @album.update(album_params)
		redirect_to '/'
	else
		render 'edit'
	end
end
def destroy
	@user=User.find(params[:user_id])
	@album=@user.albums.find(params[:id])
	if @album.destroy
		redirect_to '/'
	else
		redirect_to '/'
		flash[:alert]= "Unsucessful"
	end
end

def cover_image(id)

return @cover
end

private
def album_params
	params.require(:album).permit(:name)
end
end
