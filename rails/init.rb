Refinery::Plugin.register do |plugin|
  plugin.title = "Podcasts"
  plugin.name = "podcasts"
  plugin.description = "Manage Podcasts"
  plugin.version = 1.0
  plugin.url = {:controller => "/admin/podcasts", :action => "index"}
  plugin.activity = {
    :class => Podcast,
    :url_prefix => "edit",
    :title => 'title'
  }
  # this tells refinery where this plugin is located on the filesystem and helps with urls.
  plugin.directory = directory
end
