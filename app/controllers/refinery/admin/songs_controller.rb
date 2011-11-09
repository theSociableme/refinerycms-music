module Refinery
  module Admin
    class SongsController < ::Refinery::AdminController
      crudify 'refinery/song', :title_attribute => :title,
              :order => 'position ASC',
              :redirect_to_url => "main_app.refinery_admin_songs_path"

      def create

        @album = Refinery::Album.find(params[:album_id])
        @song = @album.songs.new(params[:song])

        if @song.save
          redirect_to main_app.refinery_admin_album_path(@album)
          flash[:notice] = 'Song created'
        else
          render :action => "new"
        end
      end
    end
  end

end