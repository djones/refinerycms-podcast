class PodcastsController < ApplicationController

  before_filter :find_all_podcasts
  before_filter :find_page

  def index
    respond_to do |format|
      format.rss do
        @items = Podcast.all
        render :layout => false
      end
    end
  end

protected

  def find_all_podcasts
    @podcasts = Podcast.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/podcasts")
  end

end
