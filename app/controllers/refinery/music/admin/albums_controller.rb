module Refinery
  module Music
    module Admin
      class AlbumsController < ::Refinery::AdminController
        crudify :'refinery/music/album',
                :title_attribute => :title,
                :order => 'position ASC'

      end

      def index
        raise "hell"
      end

    end
  end
end
