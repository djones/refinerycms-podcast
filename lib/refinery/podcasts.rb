require 'refinerycms-core'

module Refinery
  autoload :PodcastsGenerator, 'generators/refinery/podcasts/podcasts_generator'

  module Podcasts
    require 'refinery/podcasts/engine'
    require 'refinery/podcasts/configuration'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
