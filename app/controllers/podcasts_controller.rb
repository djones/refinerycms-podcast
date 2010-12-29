class PodcastsController < ApplicationController

  before_filter :find_all_podcasts
  before_filter :find_page
  before_filter :set_content_permissions, :only => [:show]
  
  def index
    respond_to do |format|
      format.rss do
        @items = Podcast.all
        render :layout => false
      end
      format.html {}   
    end
  end
  
  def show
    @podcast = Podcast.find(params[:id])
    check_content_availability(@podcast)
  end

protected

  def find_all_podcasts
    @podcasts = Podcast.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/podcasts")
  end

end
