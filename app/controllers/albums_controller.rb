class AlbumsController < ApplicationController
  def index
    @albums = Album.order("position")
  end

  def show
   # @albums = Album.published # for body_content_right
    @album = Album.find(params[:id]
  end
  

end
