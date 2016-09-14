module Refinery
  class PodcastsGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def generate_podcasts_initializer
      template "config/initializers/refinery/podcasts.rb.erb", File.join(destination_root, "config", "initializers", "refinery", "podcasts.rb")
    end

    def rake_db
      rake("refinery_podcasts:install:migrations")
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

# Added by Refinery CMS Podcasts extension
Refinery::Podcasts::Engine.load_seed
        EOH
      end
    end
  end
end
