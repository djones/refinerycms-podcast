# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-podcasts'
  s.version           = '2.0.0'
  s.description       = 'Podcasting extension for Refinery CMS'
  s.date              = '2012-06-24'
  s.summary           = 'Podcasts extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = ["David Jones", "Philip Arndt"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0'
  s.add_dependency             'acts_as_indexed',     '~> 0.7'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0'
end
