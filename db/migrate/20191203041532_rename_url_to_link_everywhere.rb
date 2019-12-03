class RenameUrlToLinkEverywhere < ActiveRecord::Migration[5.2]
  def change
    rename_column :feeds, :url, :link
    rename_column :articles, :url, :link
    rename_column :articles, :img_url, :image_link
    rename_column :articles, :audio_url, :audio_link
  end
end
