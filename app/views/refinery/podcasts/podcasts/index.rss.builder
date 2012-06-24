xml.instruct!

xml.rss 'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd', :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    # NOTE: Fill in everything with your own data down to the categories.
    xml.title 'Your Podcast Title'

    # Points to your website (e.g. http://yoursite.com/)
    xml.link root_url

    # Points to your podcast feed (e.g. http://yoursite.com/podcast.rss)
    xml.tag!('atom:link', :href => podcast_url, :rel => 'self', :type => 'application/rss+xml')

    #  Accepted values are those in the ISO 639-1 Alpha-2 list (two-letter language codes, some with possible modifiers, such as 'en-us').
    xml.language 'en-us'

    xml.copyright "© #{Time.now.year} Jack &amp; Jill"
    xml.tag!('itunes:subtitle', 'A show about everything')

    # The content of this tag is shown in the Artist column in iTunes.
    xml.tag!('itunes:author', 'John Doe')

    # This tag should be used to indicate whether or not your podcast contains
    # explicit material. The three values for this tag are "yes", "no", and "clean".
    xml.tag!('itunes:explicit', 'no')

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
    xml.tag!('itunes:image', :href => 'http://mysite.com/system/0000/1000x1000.jpg')

    # select from the list of categories here:
    # http://www.apple.com/itunes/podcasts/specs.html#categories
    xml.tag!('itunes:category', :text => "Technology") do |category|
      xml.tag!('itunes:category', :text => "Software How-To")
    end

    @podcasts.each do |item|
      xml.item do
        xml.title item.title
        xml.tag!('itunes:author', item.author)
        xml.tag!('itunes:subtitle', item.subtitle)
        xml.tag!('itunes:summary', item.summary)
        xml.enclosure :url => (request.protocol + request.host_with_port + item.file.file_name), :length => item.file.size, :type => item.file.file_mime_type
        xml.guid (request.protocol + request.host_with_port + item.file.file_name)
        xml.tag!('pubDate', item.published.to_time.rfc2822)
        xml.tag!('itunes:duration', item.duration)
        xml.tag!('itunes:keywords', item.keywords)
        xml.tag!('itunes:explicit', 'no')
      end
    end
  end
end
