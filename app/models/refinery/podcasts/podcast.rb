require 'acts_as_indexed'
require 'friendly_id'

module Refinery
  module Podcasts
    class Podcast < Refinery::Core::BaseModel
      self.table_name = 'refinery_podcasts'

      acts_as_indexed :fields => [:title, :author, :subtitle, :duration, :keywords, :summary]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :file, :class_name => '::Refinery::Resource'
      belongs_to :image, :class_name => '::Refinery::Image'

      validates :file, presence: true

      extend FriendlyId

      friendly_id :title, :use => :slugged

      def episode_number
        self.class.order('published_at DESC').
                   where(self.class.arel_table[:id].lteq(self.id)).
                   count
      end

      class << self
        def default_scope
          order "published_at DESC"
        end

        def published
          where arel_table[:published_at].lteq(Date.today)
        end

        def latest(limit = 10)
          published.limit limit
        end
      end
    end
  end
end
