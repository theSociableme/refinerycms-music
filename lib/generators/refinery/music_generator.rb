module Refinery
  class MusicGenerator < Rails::Generators::Base
    def rake_db
      rake("refinery_music:install:migrations")
    end

    source_root File.expand_path('../../../../db/seeds', __FILE__)

    def append_load_seed_data
      copy_file "music.rb", "#{Rails.root}/db/seeds/music.rb", :verbose => true
    end
  end
end

