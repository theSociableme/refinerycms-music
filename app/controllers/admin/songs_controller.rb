module Admin
  class SongsController < Admin::BaseController
    crudify :song, :title_attribute => :title
    def create
      @song = Song.new(params[:song])
      if @song.save
        redirect_to admin_album_path
        flash[:notice] = 'Song created'
      else
        render :action => "new"
      end
    end

  end
end
