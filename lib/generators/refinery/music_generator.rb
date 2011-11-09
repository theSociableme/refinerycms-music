module Refinery
  class MusicGenerator < Rails::Generators::Base
    def rake_db
      rake("refinery_music:install:migrations")
    end

    def append_load_seed_data
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by RefineryCMS Music engine
Refinery::Music::Engine.load_seed
        EOH
      end
    end
  end
end

