module Refinery
  class SongsController < ApplicationController
    before_filter :find_page

    def show
      # @album = Album.find(params[:album_id])
      @song = Refinery::Song.find(params[:id])
      @album = Refinery::Album.find(params[:album_id])
    end

    protected

    def find_page
      @page = Refinery::Page.find_by_link_url("/music")
    end
  end
end
