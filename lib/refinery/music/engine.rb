require 'refinerycms-music'

module Refinery
  module Music
    class Engine < Rails::Engine
=begin
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end
=end
      include Refinery::Engine

      isolate_namespace Refinery
      engine_name :refinery_music

      initializer "register refinerycms_music plugin", :after => :set_routes_reloader do |app|
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "refinerycms_music"
          plugin.menu_match = /(admin|refinery)\/(albums|songs|music_settings)$/
          #plugin.url = {:controller => '/admin/albums', :action => 'index'}
          plugin.url = app.routes.url_helpers.refinery_admin_albums_path
          plugin.activity = {
              :class_name => :'refinery/album',
              :title => 'title',
              :url_prefix => nil
          }
        end
      end

      config.after_initialize do
        Refinery.register_engine(Refinery::Music)
      end

    end
  end
end
