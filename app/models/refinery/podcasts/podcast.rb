require 'acts_as_indexed'
require 'friendly_id'

module Refinery
  module Podcasts
    class Podcast < Refinery::Core::BaseModel
      self.table_name = 'refinery_podcasts'

      attr_accessible :title, :author, :subtitle, :file_id, :published_at, :duration, :keywords, :summary, :position

      acts_as_indexed :fields => [:title, :author, :subtitle, :duration, :keywords, :summary]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :file, :class_name => '::Refinery::Resource'

      extend FriendlyId

      friendly_id :title, :use => :slugged

      def episode_number
        self.class.order('published_at DESC').
                   where(self.class.arel_table[:id].lteq(self.id)).
                   count
      end
    end
  end
end
