module Admin
  class AlbumsController < Admin::BaseController
    crudify :album, :title_attribute => :title

  end
end