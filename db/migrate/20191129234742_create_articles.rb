class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.integer :rss_feed_id
      t.string :title
      t.string :url
      t.text :description
      t.datetime :published_date
    end
  end
end
