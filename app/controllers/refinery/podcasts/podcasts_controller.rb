module Refinery
  module Podcasts
    class PodcastsController < ::ApplicationController

      before_filter :find_all_podcasts
      before_filter :find_page

      def index
        respond_to do |format|
          format.rss do
            render :layout => false
          end
          format.html {
            present @page
          }
        end
      end

      def show
        @podcast = Podcast.find params[:id]

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @podcast in the line below:
        present @page
      end

    protected

      def find_all_podcasts
        @podcasts = Podcast.order 'published_at DESC'
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/podcasts").first
      end

    end
  end
end
