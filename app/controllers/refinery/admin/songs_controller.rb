module Refinery
  module Admin
    class SongsController < ::Refinery::AdminController
      crudify :song, :title_attribute => :title

      def create

        @album = Refinery::Album.find(params[:album_id])
        @song = @album.songs.new(params[:song])

        if @song.save
          redirect_to admin_album_path(@album)
          flash[:notice] = 'Song created'
        else
          render :action => "new"
        end
      end
    end
  end

end