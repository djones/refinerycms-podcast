module Refinery
  module Podcasts
    module Admin
      class PodcastsController < ::Refinery::AdminController

        crudify :'refinery/podcasts/podcast',
                :xhr_paging => true,
                :order => 'published_at DESC'

      end
    end
  end
end
