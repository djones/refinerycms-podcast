xml.instruct!

xml.rss 'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd', :version => "2.0"
xml.channel do
  # NOTE: Fill in everything with your own data down to the categories.
  xml.title 'Your Podcast Title'
  xml.link 'http://yoursite.com/'
  
  #  Accepted values are those in the ISO 639-1 Alpha-2 list (two-letter language codes, some with possible modifiers, such as "en-us").
  xml.language 'en-us'
  
  xml.copyright "&#x2117; &amp; &#xA9; #{Time.now.year} Jack &amp; Jill"
  xml.tag!('itunes:subtitle', 'A show about everything')
  
  # The content of this tag is shown in the Artist column in iTunes.
  xml.tag!('itunes:author', 'John Doe')
  
  # The contents of this tag are shown in a separate window that appears when the 
  # "circled i" in the Description column is clicked. It also appears on the iTunes 
  # page for your podcast. This field can be up to 4000 characters. 
  description = "All About Everything is a show about everything. Each week we dive into any subject known to man and talk about it as much as we can. Look for our Podcast in the iTunes Store"
  
  xml.tag!('itunes:summary', description)
  xml.description description
  
  # This tag contains information that will be used to contact the owner of the podcast
  # for communication specifically about their podcast. It will not be publicly displayed.
  xml.tag!('itunes:owner') do |owner|
    xml.tag!('itunes:name', 'John Doe')
    xml.tag!('itunes:email', 'john.doe@example.com')
  end
  
  # upload an image to your resources tab and link it in here
  # iTunes prefers square .jpg images that are at least 600 x 600 pixels
  xml.tag!('itunes:image', 'http://mysite.com/system/0000/1000x1000.jpg')
  
  # select from the list of categories here:
  # http://www.apple.com/itunes/podcasts/specs.html#categories
  xml.tag!('itunes:category', :text => "Technology") do |category|
    xml.tag!('itunes:category', :text => "Software How-To")
  end
  
  @items.each do |item|
    xml.item do
      xml.title item.title
      xml.tag!('itunes:author', item.author)
      xml.subtitle item.subtitle
      xml.summary item.summary   
      xml.enclosure :url => item.file.public_filename, :length => item.file.size, :length => item.file.content_type
      xml.tag!('pubDate', item.published.strftime("%a, %d %b %Y %H:%M:%S %Z"))
      xml.tag!('itunes:duration', item.duration)
      xml.tag!('itunes:keywords', item.keywords)
    end
  end
end

