class SongsController < ApplicationController
  before_filter :find_page

  def show
   # @album = Album.find(params[:album_id])
    @song = Song.find(params[:id])
    @album = Album.find(params[:album_id])
  end

  protected

  def find_page
    @page = Page.find_by_link_url("/music")
  end

end
