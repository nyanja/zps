class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :slug
      t.text :preview
      t.text :content
      t.string :title
      t.string :description
      t.string :keywords

      t.timestamps
    end
  end
end
