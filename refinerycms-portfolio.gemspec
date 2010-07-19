Gem::Specification.new do |s|
  s.name              = %q{refinerycms-podcast}
  s.version           = %q{0.5}
  s.description       = %q{Plugin for Refinery CMS to manage and publish podcasts to iTunes}
  s.date              = %q{2010-07-19}
  s.summary           = %q{Ruby on Rails podcast plugin for RefineryCMS.}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.authors           = %w(David Jones)

  s.files             = [
    'readme.md',
    'license.md',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/portfolio_entries_controller.rb',
    'app/controllers/portfolio_controller.rb',
    'app/helpers',
    'app/helpers/portfolio_helper.rb',
    'app/models',
    'app/models/portfolio_entry.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/portfolio_entries',
    'app/views/admin/portfolio_entries/_form.html.erb',
    'app/views/admin/portfolio_entries/_list.html.erb',
    'app/views/admin/portfolio_entries/_sortable_list.html.erb',
    'app/views/admin/portfolio_entries/edit.html.erb',
    'app/views/admin/portfolio_entries/index.html.erb',
    'app/views/admin/portfolio_entries/new.html.erb',
    'app/views/portfolio',
    'app/views/portfolio/_main_image.html.erb',
    'app/views/portfolio/empty.html.erb',
    'app/views/portfolio/show.html.erb',
    'config/locales',
    'config/locales/en.yml',
    'config/locales/sl.yml',
    'config/routes.rb',
    'generators/portfolio',
    'generators/portfolio/portfolio_generator.rb',
    'generators/portfolio/templates',
    'generators/portfolio/templates/migration.rb',
    'lib/gemspec.rb',
    'lib/portfolio.rb',
    'lib/tasks',
    'lib/tasks/portfolio.rake',
    'public/javascripts',
    'public/javascripts/portfolio.js',
    'public/stylesheets',
    'public/stylesheets/portfolio.css',
    'rails/init.rb'
  ]
  
end
