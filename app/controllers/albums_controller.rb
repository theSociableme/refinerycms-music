class AlbumsController < ApplicationController
  def index
    @albums = Album.published
  end

  def show
    @albums = Album.published # for body_content_right
    @album = Album.find(params[:id], :conditions => {:published => true})
  end
  

end
