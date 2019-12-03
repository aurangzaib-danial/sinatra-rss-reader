class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  
  attr_accessor :parsed_feed

  def make_articles_from_parsed_feed
    parsed_feed.items.each do |item|
      
      article = articles.build
      
      article.title = item.title
      article.url = item.link
      article.description = item.description
      article.published_date = item.pubDate
      
      if item.media_content_type && item.media_content_type.include?('image')
        article.img_url = item.media_content_url
      else
        article.img_url = item.media_thumbnail_url
      end

      article.audio_url = item.enclosure_url
      article.audio_type = item.enclosure_type

    end
  end

  def self.new_from_rss_url(url:, user_id:)
    parsed_feed = parse_feed(url)

    feed = Feed.new
    feed.title = parsed_feed.channel.title
    feed.url = url
    feed.parsed_feed = parsed_feed
    feed.user_id = user_id

    feed.make_articles_from_parsed_feed

    feed.save

    feed
  end

  def self.parse_feed(url)
    rss = open(url)
    SimpleRSS.parse(rss)
  end
end