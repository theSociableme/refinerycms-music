module Refinery
  module Music
    module Admin
      class SongsController < ::Refinery::AdminController
        crudify 'refinery/music/song', :title_attribute => :title,
                :order => 'position ASC'

        def new
          @album = Refinery::Music::Album.find(params[:album_id])
          @song = @album.songs.build
        end

        def edit
          @song = Refinery::Music::Song.find(params[:id])
          @album = @song.album
        end

        def create

          @album = Refinery::Music::Album.find(params[:album_id])
          @song = @album.songs.new(params[:song])

          if @song.save
            redirect_to refinery.music_admin_album_path(@album)
            flash[:notice] = 'Song created'
          else
            render :action => "new"
          end
        end
        #
        #def update_positions
        #
        #end
      end
    end
  end

end