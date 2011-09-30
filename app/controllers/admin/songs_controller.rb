module Admin
  class SongsController < Admin::BaseController
    crudify :song, :title_attribute => :title
    def create
      
      @album = Album.find(params[:album_id])
      @song = @album.songs.new(params[:song])
      
      if @song.save
        redirect_to admin_album_path(@album)
        flash[:notice] = 'Song created'
      else
        render :action => "new"
      end
    end
    
    def update
      @album = Album.find(params[:album_id])
      @song = Song.find(params[:id])
      
      if @song.update_attributes(params[:song])
        flash[:notice] = "Successfully updated song"
      end
      respond_with(@song)
    end

  end
end
