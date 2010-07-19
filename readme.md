# Podcast plugin for [RefineryCMS](http://www.refinerycms.com) ([Github](http://github.com/djones/refinerycms-podcast))

By: [David Jones](http://www.d-jones.com) from [Resolve Digital](http://www.resolvedigital.com)

## Installation Using Gem

Open your ``Gemfile`` and add this line to the bottom:

    gem 'refinerycms-podcast', '= 0.5'

Now run ``bundle install`` and once bundler has installed the gem run:

    rake refinery:podcast:install

..and follow the instructions!

## Installation using Plugin

From within your Refinery directory at command line, install this as a plugin using:

    script/plugin install git://github.com/djones/refinerycms-podcast.git

Then run:

    rake refinery:podcast:install

## Setup

Edit ``/app/views/podcasts/index.rss.builder`` and fill out the documented parts with your podcast
channel information.

## Usage

Now on the backend of Refinery you should see a new "Podcast" tab. You can add your podcasts one by one there as you wish to publish them.

## iTunes Setup

Your iTunes Podcast URL should now be available at:

    http://yoursite.com/podcast.rss
  
Now you need to tell iTunes about your podcast URL. Read: [How to publish a podcast on the iTunes Store](http://support.apple.com/kb/TA23478)

For more detailed technical information about making iTunes podcasts read: [Making a Podcast](http://www.apple.com/itunes/podcasts/specs.html)