module Refinery
  module Podcasts
    module Admin
      class PodcastsController < ::Refinery::AdminController

        crudify :'refinery/podcasts/podcast', order: 'published_at DESC'

        private

        def podcast_params
          params.require(:podcast).permit(permitted_podcast_params)
        end

        def permitted_podcast_params
          [
            :title, :author, :subtitle, :file_id, :image_id,
            :published_at, :duration, :keywords, :summary, :position
          ]
        end

      end
    end
  end
end
