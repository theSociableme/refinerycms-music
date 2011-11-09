module Refinery
  module Admin
    class AlbumsController < ::Refinery::AdminController
      crudify :'refinery/album',
              :title_attribute => :title,
              :order => 'position ASC',
              :redirect_to_url => "main_app.refinery_admin_albums_path"
    end
  end
end
