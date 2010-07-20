ActionController::Routing::Routes.draw do |map|
  map.resources :podcasts

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :podcasts, :collection => {:update_positions => :post, :settings => :get}
  end
  
  map.podcast '/podcast.rss', :controller => "podcasts", :action => "index", :format => "rss"

end
