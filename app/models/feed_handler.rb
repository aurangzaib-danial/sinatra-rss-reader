class FeedHandler
  attr_reader :feed, :error, :rss

  def initialize(feed)
    @feed = feed
  end

  def handle_new_feed
    begin
      parse_rss
      add_feed_attributes
      create_feed_articles
    rescue
      @error = true
      puts "Adding data from RSS to Feed failed!"
    end
  end

  def add_feed_attributes 
    feed.title = rss.title.force_encoding('UTF-8')
    
    begin
      feed.image_link = rss.url.force_encoding('UTF-8')
    rescue NoMethodError
      feed.image_link = nil
    end
  end

  def create_feed_articles
    rss.items.each do |item|
      encode_data(item)
      create_article(item)
    end
  end

  def update_feed_articles
    parse_rss
    
    feed.updated_articles_count = 0

    rss.items.each do |item|
      encode_data(item)

      article = feed.articles.find_by_title(item.title)
      
      unless article
        create_article(item).save
        
        feed.updated_articles_count += 1
      end
    
    end
  end

  def create_article(item)
    
    feed.articles.build.tap do |article|
      
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

    end
  end

  def encode_data(item)
    item.title.force_encoding('UTF-8') if item.title
    item.link.force_encoding('UTF-8') if item.link
    item.description.force_encoding('UTF-8') if item.description
    item.media_content_type.force_encoding('UTF-8') if item.media_content_type
    item.media_thumbnail_url.force_encoding('UTF-8') if item.media_thumbnail_url
    item.enclosure_url.force_encoding('UTF-8') if item.enclosure_url
    item.enclosure_type.force_encoding('UTF-8') if item.enclosure_type
  end

  def any_error?
    !!error
  end

  def parse_rss
    @rss = SimpleRSS.parse open(feed.link)
  end

end