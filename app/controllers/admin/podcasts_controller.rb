class Admin::PodcastsController < Admin::BaseController

  crudify :podcast, :title_attribute => :title, :order => "published DESC"

end
