class AlbumsController < ApplicationController
  before_filter :find_page
  def index
    @albums = Album.order("position")
  end

  def show
   # @albums = Album.published # for body_content_right
    @album = Album.find(params[:id])
  end
  
  protected

    def find_page
      @page = Page.find_by_link_url("/music")
    end

end
