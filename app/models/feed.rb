class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  
  attr_accessor :parsed_feed

  def make_articles_from_parsed_feed
    parsed_feed.items.each do |item|
      
      article = articles.build
      
      article.title = item.title
      article.link = item.link
      article.description = item.description
      article.published_date = item.pubDate
      
      if item.media_content_type && item.media_content_type.include?('image')
        article.image_link = item.media_content_url
      else
        article.image_link = item.media_thumbnail_url
      end

      article.audio_link = item.enclosure_url
      article.audio_type = item.enclosure_type

    end
  end

  def self.new_from_rss_link(link:, user_id:)
    parsed_feed = parse_feed(link)

    feed = Feed.new
    feed.title = parsed_feed.channel.title
    feed.link = link
    feed.parsed_feed = parsed_feed
    feed.user_id = user_id

    feed.make_articles_from_parsed_feed

    feed.save

    feed
  end

  def self.parse_feed(link)
    rss = open(link)
    SimpleRSS.parse(rss)
  end
end