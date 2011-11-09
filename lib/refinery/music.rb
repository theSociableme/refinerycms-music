require 'refinerycms-core'

module Refinery
  autoload :MusicGenerator, 'generators/refinery/music_generator'

  module Music
    require 'refinery/music/engine' if defined?(Rails)

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join("spec/factories").to_s ]
      end
    end
  end
end
