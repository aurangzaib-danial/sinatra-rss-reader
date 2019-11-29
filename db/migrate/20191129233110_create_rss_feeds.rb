class CreateRssFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :rss_feeds do |t|
      t.string :title
      t.string :url
    end
  end
end
