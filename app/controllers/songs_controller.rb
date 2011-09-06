class SongsController < ApplicationController
  before_filter :find_page

  def index
    @songs = @album.songs.published
  end

  def show
    @album = @album = Album.find(params[:album_id])
    @songs = @album.songs.published # for body_content_right
    @song = @songs.find(params[:id])
  end

protected

  def find_page
    @page = Page.find_by_link_url("/music")
  end

end
