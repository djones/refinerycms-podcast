require 'uri' # used for URI.encode
xml.instruct!

xml.rss 'xmlns:itunes' => 'http://www.itunes.com/dtds/podcast-1.0.dtd', :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
  xml.channel do
    # Points to your website (e.g. http://yoursite.com/)
    base_url = request.protocol + request.host_with_port

    # NOTE: Fill in everything with your own data down to the categories.
    xml.title Refinery::Podcasts.title

    # Points to your website (e.g. http://yoursite.com/)
    xml.link base_url

    # Points to your podcast feed (e.g. http://yoursite.com/podcasts.rss)
    xml.tag!('atom:link', :href => refinery.podcasts_podcasts_url(format: :rss), :rel => 'self', :type => 'application/rss+xml')

    # Accepted values are those in the ISO 639-1 Alpha-2 list (two-letter language codes, some with possible modifiers, such as 'en-us').
    xml.language Refinery::Podcasts.language

    xml.copyright "© #{Time.now.year} #{Refinery::Core.site_name}"
    xml.tag!('itunes:subtitle', Refinery::Podcasts.subtitle)

    # The content of this tag is shown in the Artist column in iTunes.
    xml.tag!('itunes:author', Refinery::Podcasts.author)

    # This tag should be used to indicate whether or not your podcast contains
    # explicit material. The three values for this tag are "yes", "no", and "clean".
    xml.tag!('itunes:explicit', Refinery::Podcasts.explicit_content)

    # The contents of this tag are shown in a separate window that appears when the
    # "circled i" in the Description column is clicked. It also appears on the iTunes
    # page for your podcast. This field can be up to 4000 characters.
    xml.tag!('itunes:summary', Refinery::Podcasts.description)
    xml.description Refinery::Podcasts.description

    # This tag contains information that will be used to contact the owner of the podcast
    # for communication specifically about their podcast. It will not be publicly displayed.
    xml.tag!('itunes:owner') do |owner|
      xml.tag!('itunes:name', Refinery::Podcasts.owner_name)
      xml.tag!('itunes:email', Refinery::Podcasts.owner_email)
    end

    # upload an image to your resources tab and link it in here
    # iTunes prefers square .jpg or .png images that are between
    # 1400 x 1400 pixels and 3000 x 3000 pixels
    xml.tag!('itunes:image', :href => Refinery::Podcasts.image_url)

    # select from the list of categories here:
    # https://help.apple.com/itc/podcasts_connect/?lang=en#/itc9267a2f12
    xml.tag!('itunes:category', :text => Refinery::Podcasts.category) do |node|
      xml.tag!('itunes:category', :text => Refinery::Podcasts.subcategory)
    end

    @podcasts.each do |item|
      item_url = request.protocol + request.host_with_port + item.file.url
      xml.item do
        xml.title item.title
        xml.tag!('itunes:author', item.author)
        xml.tag!('itunes:subtitle', item.subtitle)
        xml.tag!('itunes:summary', strip_tags(item.summary))
        xml.enclosure :url => item_url, :length => item.file.size, :type => item.file.file_mime_type
        xml.guid item_url
        xml.tag!('pubDate', item.published_at.to_time.rfc2822)
        xml.tag!('itunes:duration', item.duration)
        xml.tag!('itunes:keywords', item.keywords)
        xml.tag!('itunes:explicit', Refinery::Podcasts.explicit_content)
      end
    end
  end
end
