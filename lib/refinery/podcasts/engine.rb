module Refinery
  module Podcasts
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Podcasts

      engine_name :refinery_podcasts

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.pathname = root
          plugin.name = "podcasts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.podcasts_admin_podcasts_path }
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Podcasts)
      end
    end
  end
end
