class SongsController < ApplicationController
  before_filter :find_page

  def show
    @song = Song.find(params[:id])
  end

  protected

  def find_page
    @page = Page.find_by_link_url("/music")
  end

end
