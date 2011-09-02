module Admin
  class SongsController < Admin::BaseController
    crudify :song, :title_attribute => :title
    

  end
end
