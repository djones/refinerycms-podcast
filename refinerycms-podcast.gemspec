# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = "refinerycms-podcast"
  s.version           = "1.0.0"
  s.description       = "Podcasting extension for Refinery CMS"
  s.date              = "2016-09-15"
  s.summary           = "Podcasts extension for Refinery CMS"
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]
  s.authors           = ["David Jones", "Philip Arndt"]

  # Runtime dependencies
  s.add_dependency    "refinerycms-core", "~> 3.0"
  s.add_dependency    "refinerycms-images", "~> 3.0"
  s.add_dependency    "refinerycms-acts-as-indexed", "~> 2.0"
  s.add_dependency    "friendly_id", "~> 5.0"

  # Development dependencies (usually used for testing)
  s.add_development_dependency "refinerycms-testing", "~> 3.0"
end
