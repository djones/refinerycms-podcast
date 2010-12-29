User.find(:all).each do |user|
  user.plugins.create(:name => "podcasts",
                      :position => (user.plugins.maximum(:position) || -1) +1)
end

page = Page.create(
  :title => "Podcasts",
  :link_url => "/podcasts",
  :deletable => false,
  :show_in_menu => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => "^/podcasts(\/|\/.+?|)$"
)
Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
