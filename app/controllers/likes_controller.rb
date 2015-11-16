class LikesController < ApplicationController

def create
	@user=User.find(current_user)
	@sharing=Sharing.find(params[:sharing_id])
	@like=@sharing.likes.build(:sharing_id => params[:sharing_id], :author => current_user.username)
if @like.save
	if request.xhr?
        render :json => {
                            :like_number => @like.id
                        }
     end
	
else
	respond_to do |format|
	format.html { flash[:notice] = "error"}
  end
end

end
def destroy
	@sharing=Sharing.find(params[:sharing_id])
	@like=@sharing.likes.find(params[:id])
	
	if @like.destroy
		respond_to do |format|
		format.html { render :nothing => true}
	  	end
  else
	  	respond_to do |format|
		format.html { flash[:notice] = "error"}
	  	end
	end

end

end
