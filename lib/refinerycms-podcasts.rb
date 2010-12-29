require File.expand_path('../podcasts', __FILE__)

module Refinery
  module Podcasts
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "podcasts"
          plugin.directory = "podcasts"
          plugin.menu_match = /(refinery|admin)\/podcast(s|_settings)$/
          plugin.activity = {:class => Podcast}
        end
      end
    end
  end
end
