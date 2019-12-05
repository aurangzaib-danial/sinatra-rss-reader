class AddReadToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :read, :boolean, default: 0
  end
end
