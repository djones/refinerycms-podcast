class PodcastsController < ApplicationController

  def index
    respond_to do |format|
      format.rss do
        @items = Podcast.all
        render :layout => false
      end
    end
  end

end
