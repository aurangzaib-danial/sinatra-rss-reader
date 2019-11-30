class AddImageUrlToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :img_url, :string
  end
end
