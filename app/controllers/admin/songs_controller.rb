module Admin
  class SongsController < Admin::BaseController
    crudify :song, :title_attribute => :title
    def new
      @song = @album.songs.new
    end

  end
end
