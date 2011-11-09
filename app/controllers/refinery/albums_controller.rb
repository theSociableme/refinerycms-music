module Refinery
  class AlbumsController < ::ApplicationController
    before_filter :find_page

    def index
      @albums = Refinery::Album.order("position")
    end

    def show
      @album = Refinery::Album.find(params[:id])
      @songs = @album.songs.order("position")
    end

    protected

    def find_page
      @page = Refinery::Page.find_by_link_url("/music")
    end
  end
end
