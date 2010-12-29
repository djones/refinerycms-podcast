module NavigationHelpers
  module Refinery
    module Podcasts
      def path_to(page_name)
        case page_name
        when /the list of podcasts/
          admin_podcasts_path

         when /the new podcast form/
          new_admin_podcast_path
        else
          nil
        end
      end
    end
  end
end
