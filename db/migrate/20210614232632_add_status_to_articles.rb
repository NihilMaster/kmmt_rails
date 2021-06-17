# Migration for the establishment of the status of the Article
class AddStatusToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :status, :string
  end
end
