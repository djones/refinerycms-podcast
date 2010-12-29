Given /^I have no podcasts$/ do
  Podcast.delete_all
end

Given /^I (only )?have podcasts titled "?([^"]*)"?$/ do |only, titles|
  Podcast.delete_all if only
  titles.split(', ').each do |title|
    Podcast.create(:title => title)
  end
end

Then /^I should have ([0-9]+) podcasts?$/ do |count|
  Podcast.count.should == count.to_i
end
