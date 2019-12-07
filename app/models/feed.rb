class Feed < ActiveRecord::Base
  belongs_to :user
  has_many :articles
  validates :title, uniqueness: { scope: :user_id }

  attr_accessor :updated_articles_count

  def update_articles
    feed_handler = FeedHandler.new(self)
    feed_handler.update_feed_articles
  end

  def self.new_from_rss(link:, user_id:)
    feed = self.new
    feed.link = link
    feed.user_id = user_id

    feed_handler = FeedHandler.new(feed)
    feed_handler.handle_new_feed

    feed_handler.any_error? ? false : feed

  end

  def self.create_from_rss(link:, user_id:)
    feed = new_from_rss(link: link, user_id: user_id)
    feed.save if feed
    feed
  end

end