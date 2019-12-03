class RenameRssFeedsToFeeds < ActiveRecord::Migration[5.2]
  def change
    rename_table :rss_feeds, :feeds
  end
end
