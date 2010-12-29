class Podcast < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :author, :subtitle, :duration, :keywords, :summary, :content_type_tags, :genre_tags, :topic_tags]
  
  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :file, :class_name => 'Resource'
  
  default_scope :order => "published DESC"

  def episode_number
    episode = 0
    
    Podcast.find(:all, :order => "published ASC").each do |p|
      episode += 1
      break if p === self
    end
    
    episode
  end
  
end
