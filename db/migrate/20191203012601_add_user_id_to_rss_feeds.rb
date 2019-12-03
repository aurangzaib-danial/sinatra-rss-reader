class AddUserIdToRssFeeds < ActiveRecord::Migration[5.2]
  def change
    add_column :rss_feeds, :user_id, :integer
  end
end
