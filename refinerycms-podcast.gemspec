Gem::Specification.new do |s|
  s.name              = %q{refinerycms-podcast}
  s.version           = %q{0.6}
  s.description       = %q{Plugin for Refinery CMS to manage and publish podcasts to iTunes}
  s.date              = %q{2010-10-26}
  s.summary           = %q{Ruby on Rails podcast plugin for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(David\ Jones)
  s.require_paths     = %w(lib)

  s.files             = [
    'app',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/podcasts_controller.rb',
    'app/controllers/podcasts_controller.rb',
    'app/models',
    'app/models/podcast.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/podcasts',
    'app/views/admin/podcasts/_form.html.erb',
    'app/views/admin/podcasts/_podcast.html.erb',
    'app/views/admin/podcasts/edit.html.erb',
    'app/views/admin/podcasts/index.html.erb',
    'app/views/admin/podcasts/new.html.erb',
    'app/views/podcasts',
    'app/views/podcasts/index.rss.builder',
    'config',
    'config/locales',
    'config/locales/en.yml',
    'config/locales/nl.yml',
    'config/routes.rb',
    'generators',
    'generators/podcast',
    'generators/podcast/podcast_generator.rb',
    'generators/podcast/templates',
    'generators/podcast/templates/migration.rb',
    'lib',
    'lib/gemspec.rb',
    'lib/refinery',
    'lib/refinery/podcast.rb',
    'lib/tasks',
    'lib/tasks/podcast.rake',
    'license.md',
    'rails',
    'rails/init.rb',
    'readme.md'
  ]
  
end
