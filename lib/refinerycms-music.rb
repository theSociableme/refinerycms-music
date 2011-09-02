require 'refinery'

module Refinery
  module Music
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "music"
          plugin.menu_match = /(admin|refinery)\/(albums|songs|music_settings)?$/
          plugin.url = {:controller => '/admin/albums', :action => 'index'}
          plugin.activity = {
            :class => Album,
            :title => 'title'
          }
        end
      end
    end
  end
end
