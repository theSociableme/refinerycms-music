module Refinery
  module Music
    module Admin
      class SongsController < ::Refinery::AdminController
        crudify 'refinery/music/song', :title_attribute => :title,
                :order => 'position ASC'


        def create

          @album = Refinery::Music::Album.find(params[:album_id])
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

end