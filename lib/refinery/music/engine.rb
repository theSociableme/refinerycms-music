require 'refinerycms-music'

module Refinery
  module Music
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Music
      engine_name :refinery_music

      initializer "register refinerycms_music plugin", :after => :set_routes_reloader do |app|
        Refinery::Plugin.register do |plugin|
          plugin.name = "music"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.music_admin_albums_path }
          plugin.pathname = root

          plugin.activity = {
              :class_name => :'refinery/music/album',
              :title => 'title'
          }

          #plugin.menu_match = /(admin|refiner/y)\/(music|albums|songs|music_settings)$/
          #plugin.url = {:controller => '/refinery/albums', :action => 'index'}


        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Music)
      end

    end
  end
end
