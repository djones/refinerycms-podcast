Refinery::Plugin.register do |plugin|
  plugin.name = "podcasts"

  # Add support for older versions
  if Refinery.version < '0.9.8'
    plugin.title = "Podcasts" if Refinery.version < '0.9.8'
    plugin.description = "Manage Podcasts"
    plugin.directory = directory
  end

  plugin.version = '0.6'
  plugin.url = {:controller => "/admin/podcasts", :action => "index"}
  plugin.activity = {
    :class => Podcast,
    :url_prefix => "edit",
    :title => 'title'
  }
end
