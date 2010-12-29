require 'refinery'

module Refinery
  module Podcasts
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "podcasts"
          plugin.activity = {:class => Podcast}
        end
      end
    end
  end
end
