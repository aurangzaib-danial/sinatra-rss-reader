class RSSFeed < ActiveRecord::Base
  # attr_accessor :title, :url
  # belongs_to :user
  # has_many :articles
  validates_presence_of :title, :url
  def self.new_from_url(url)
    rss_file = open(url)
    parsed_feed = RSS::Parser.parse(rss_file)

    self.new.tap do |feed|
      feed.title = parsed_feed.channel.title
      feed.url = url
    end
  end
end