class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  validates :title, uniqueness: { scope: :user_id }
  
  attr_accessor :parsed_feed

  def make_articles_from_parsed_feed
    parsed_feed.items.each do |item|
      make_article_from_parsed_feed_item(item)
    end
  end

  def make_article_from_parsed_feed_item(item)
    item.title.force_encoding('UTF-8') if item.title
    item.link.force_encoding('UTF-8') if item.link
    item.description.force_encoding('UTF-8') if item.description
    item.media_content_type.force_encoding('UTF-8') if item.media_content_type
    item.media_thumbnail_url.force_encoding('UTF-8') if item.media_thumbnail_url
    item.enclosure_url.force_encoding('UTF-8') if item.enclosure_url
    item.enclosure_type.force_encoding('UTF-8') if item.enclosure_type

    article = articles.build
      
    article.title = item.title
    article.link = item.link
    article.description = item.description
    article.published_date = item.pubDate || item.published
    
    if item.media_content_type && item.media_content_type.include?('image')
      article.image_link = item.media_content_url
    else
      article.image_link = item.media_thumbnail_url
    end

    if item.enclosure_type

      if item.enclosure_type.include?('audio')
        article.audio_link = item.enclosure_url
        article.audio_type = item.enclosure_type
      elsif item.enclosure_type.include?('image')
        article.image_link = item.enclosure_url
      end

    end

    article
  end

  def update_articles_and_return_count
    self.parsed_feed = self.class.parse_feed(link)
    
    new_articles_count = 0
    
    parsed_feed.items.each do |item|

      article = articles.find_by_title(item.title)
      
      unless article
        make_article_from_parsed_feed_item(item).save
        
        new_articles_count += 1
      end
    
    end

    new_articles_count

  end

  def self.new_from_rss_link(link:, user_id:)
    begin
      parsed_feed = parse_feed(link)
    
      feed = Feed.new
      feed.link = link
      feed.user_id = user_id
      feed.title = parsed_feed.title.force_encoding('UTF-8')
      begin
        feed.image_link = parsed_feed.url.force_encoding('UTF-8')
      rescue NoMethodError
        feed.image_link = nil
      end
      feed.parsed_feed = parsed_feed
      
      feed.make_articles_from_parsed_feed

      feed
    rescue
      return false
    end
  end

  def self.create_from_rss_link(link:, user_id:)
    feed = new_from_rss_link(link: link, user_id: user_id)
    feed.save if feed
    feed
  end

  def self.parse_feed(link)
    rss = open(link)
    SimpleRSS.parse(rss)
  end
end