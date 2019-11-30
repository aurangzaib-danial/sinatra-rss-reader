class RSSFeed < ActiveRecord::Base
  # belongs_to :user
  has_many :articles

  validates_presence_of :title, :url
  attr_accessor :parsed_feed

  def make_articles_from_parsed_feed
    parsed_feed.items.each do |item|
      article = articles.build
      article.title = item.title
      article.url = item.link
      article.description = item.description
      article.published_date = item.pubDate

      article.save
    end
  end

  def self.new_from_url(url)
    parsed_feed = parse_feed(url)

    self.new.tap do |feed|
      feed.title = parsed_feed.channel.title
      feed.url = url
      feed.parsed_feed = parsed_feed

      feed.make_articles_from_parsed_feed
    end
  end

  def self.parse_feed(url)
    rss_file = open(url)
    RSS::Parser.parse(rss_file)
  end
end