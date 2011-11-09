module Refinery
  module Admin
    class AlbumsController < ::Refinery::AdminController
      crudify :album, :title_attribute => :title
    end
  end
end
