class CreateArticlesLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_links do |t|
      t.integer :article_id, index: true
      t.integer :link_id, index: true
    end
  end
end
