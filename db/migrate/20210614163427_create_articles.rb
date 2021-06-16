class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps #For created_at n update_at
    end
  end
end
