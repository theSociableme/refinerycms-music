module Refinery
  module Music
    module Admin
      class MusicSettingsController < ::Refinery::AdminController
        crudify :'refinery/music/music_setting',
                :title_attribute => :name,
                :order => "id ASC",
                :searchable => false

        def toggle
          @music_setting = Refinery::Music::MusicSetting.find(params[:id])
          @music_setting.toggle!(:value)

          flash[:notice] = "Comment from '#{@music_setting.name}' has been set to '#{@music_setting.value ? 'true' : 'false'}'"

          redirect_to :action => 'index'
        end
      end
    end
  end
end
