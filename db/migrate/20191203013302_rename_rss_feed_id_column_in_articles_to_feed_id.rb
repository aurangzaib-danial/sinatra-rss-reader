class RenameRssFeedIdColumnInArticlesToFeedId < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :rss_feed_id, :feed_id
  end
end
