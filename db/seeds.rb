Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.find_each do |user|
      if user.plugins.where(:name => 'podcasts').blank?
        user.plugins.create(:name => 'podcasts',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  url = "/podcasts"
  if defined?(Refinery::Page) && Refinery::Page.where(:link_url => url).empty?
    page = Refinery::Page.create(
      :title => 'Podcasts',
      :link_url => url,
      :deletable => false,
      :menu_match => "^#{url}(\/|\/.+?|)$"
    )
    Refinery::Pages.default_parts.each_with_index do |default_page_part, index|
      page.parts.create(:title => default_page_part, :body => nil, :position => index)
    end
  end
end
