module Refinery
  module Podcasts
    include ActiveSupport::Configurable

    config_accessor :title, :subtitle, :description, :author, :explicit_content,
                    :language, :image_url, :category, :subcategory,
                    :owner_name, :owner_email

    self.title = "#{Refinery::Core.site_name} Podcast"
    self.subtitle = "A show by #{Refinery::Core.site_name}"
    self.description = "This is a podcast produced by #{Refinery::Core.site_name}"
    self.author = "#{Refinery::Core.site_name}"
    self.explicit_content = "no"
    self.language = "en-us"

    self.category = "Technology"
    self.subcategory = "Tech News"

  end
end
