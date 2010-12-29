class Podcast < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :author, :subtitle, :duration, :keywords, :summary]
  
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
