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
	@images=@album.photos.paginate(page: params[:page], per_page: 4)
	respond_to do |format|
    format.html
    format.json { render json: @images }
    format.js
  				end

end
def edit
	@user=User.find(params[:user_id])
	@album=@user.albums.find(params[:id])
end
def update
	@user=User.find(current_user)
	@album=@user.albums.find(params[:id])
	if @album.update(album_params)
		redirect_to '/'
	else
		render 'edit'
	end
end
def destroy
	@user=User.find(current_user)
	@album=@user.albums.find(params[:id])
	@album.destroy
		 respond_to do |format|
      format.html { redirect_to '/' }
      format.json
      format.js   { render :layout => false }
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
