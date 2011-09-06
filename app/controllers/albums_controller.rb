class AlbumsController < ApplicationController
  before_filter :find_page
  def index
    @albums = Album.order("position")
  end

  def show
    @album = Album.find(params[:id])
    @ssongs = @album.songs.published
  end
  
  protected

    def find_page
      @page = Page.find_by_link_url("/music")
    end

end
