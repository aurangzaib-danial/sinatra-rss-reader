class AddAudioUrlTypeToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :audio_url, :string
    add_column :articles, :audio_type, :string
  end
end
