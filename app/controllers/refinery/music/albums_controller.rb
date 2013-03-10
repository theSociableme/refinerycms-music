class Refinery::Music::AlbumsController < ::ApplicationController
  before_filter :find_page

  def index
    @albums = Refinery::Music::Album.order("position")
  end

  def show
    @album = Refinery::Music::Album.find(params[:id])
    @songs = @album.songs.order("position")
  end

  protected

  def find_page
    @page = Refinery::Page.find_by_link_url("/music")
  end
end
